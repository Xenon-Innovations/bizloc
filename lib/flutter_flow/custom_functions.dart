import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool validateEmail(String? email) {
  final RegExp emailRegExp =
      RegExp(r"^[a-zA-Z0-9._%\-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  if (email == null || email.isEmpty) {
    return true; // Возвращаем true, если email null или пустой
  }
  return emailRegExp.hasMatch(email) && !email.contains('+');
}

LatLng parseLatLng(dynamic json) {
  double lat = json['lat'] as double;
  double lng = json['lng'] as double;
  return LatLng(lat, lng);
}

String latLngToString(LatLng coordinates) {
  return '${coordinates.latitude},${coordinates.longitude}';
}

List<int> createListOfSix(
  int a,
  int b,
  int c,
  int d,
  int e,
  int f,
) {
  return [a, b, c, d, e, f];
}

List<PropertyObjectStruct> parsePropertiesFromJson(dynamic json) {
  List<dynamic> jsonList = json['data']['availableProperty'];
  List<PropertyObjectStruct> result = jsonList.map((item) {
    List<dynamic> coordinations = item['coordinations'];
    List<dynamic> firstCoordination = coordinations[0];
    List<double> coords = firstCoordination.cast<double>();
    if (coordinations.isEmpty) {
      throw ArgumentError('Coordinations list cannot be empty');
    }

    return PropertyObjectStruct(
      listingId: item['listingId'],
      type: item['type'],
      coordinations: coords,
    );
  }).toList();
  return result;
}

bool jsonStatusSuccess(dynamic json) {
  return (json['status'] == 200);
}

String getYearRenowated(String input) {
  return input.split('/')[1];
}

List<int> calculatePercentiles(int number) {
// Ensure the number is non-negative
  if (number < 0) {
    throw ArgumentError("Number must be non-negative");
  }

  List<int> percentiles = [];
  for (int i = 0; i <= 5; i++) {
    percentiles.add((number * i ~/ 5));
  }

  return percentiles;
}

int findMaxOfFive(
  int a,
  int b,
  int c,
  int d,
  int e,
) {
  int max = [a, b, c, d, e].reduce(
      (currentMax, element) => currentMax > element ? currentMax : element);

  // Find the nearest round value greater than the maximum
  int nearestRoundValue = 1;
  while (nearestRoundValue <= max) {
    nearestRoundValue *= 10; // Progress in powers of 10
  }

  // If the nearestRoundValue / 2 (e.g., 5, 50, 500) is greater than max, return it
  if (nearestRoundValue / 2 >= max) {
    return nearestRoundValue ~/ 2;
  }

  return nearestRoundValue;
}

List<GoogleMapDataStruct> mapPropertyObjectsToLocations(
    List<PropertyObjectStruct> inputList) {
  final salePath = "sale_marker.png";
  final leasePath = "lease_marker.png";
  return inputList.map((obj) {
    return GoogleMapDataStruct(
        listingId: obj.listingId,
        type: obj.type,
        latLng: LatLng(obj.coordinations[1], obj.coordinations[0]),
        title: 'Listing ID: ' + obj.listingId,
        description: obj.type == "sale" ? "For sale" : "For lease",
        iconPath: obj.type == "sale" ? salePath : leasePath);
  }).toList();
}

int findLatLngIndex(
  LatLng target,
  List<LatLng> latLngList,
) {
  for (int i = 0; i < latLngList.length; i++) {
    if (latLngList[i].latitude == target.latitude &&
        latLngList[i].longitude == target.longitude) {
      return i; // Return the index if a match is found
    }
  }
  return -1; // Return -1 if no match is found
}

String extraImages(int numberOfImages) {
  if (numberOfImages > 4) {
    int extra = numberOfImages - 4;
    return "+$extra ${extra == 1 ? 'image' : 'images'}";
  }
  return "No extra images";
}

String getYearBuilt(String input) {
  return input.split('/')[0];
}

String combineHighlights(List<String> highlights) {
  if (highlights.isEmpty) return "";

  return highlights.map((highlight) => "- $highlight").join("\n");
}

String availableSpacesToString(List<dynamic> availableSpaces) {
  // Helper function to safely get a field value or return "N/A"
  String safeGet(Map<String, dynamic> space, String key) {
    return space[key]?.toString() ?? "N/A";
  }

  // Helper function to format a list field or return "N/A"
  String formatListField(dynamic field) {
    if (field == null || (field is List && field.isEmpty)) {
      return "N/A";
    }
    return '\n' + field.map((item) => '- $item').join('\n');
  }

  // Function to format each space JSON into a readable string
  String formatSpace(Map<String, dynamic> space) {
    final StringBuffer sb = StringBuffer();
    sb.writeln('Name: ${safeGet(space, "name")}');
    sb.writeln('Description: ${safeGet(space, "description")}');
    sb.writeln('Size: ${safeGet(space, "size")}');
    sb.writeln('Term: ${safeGet(space, "term")}');
    sb.writeln('Rental Rate: ${safeGet(space, "rentalRate")}');
    sb.writeln('Space Use: ${safeGet(space, "spaceUse")}');
    sb.writeln('Condition: ${safeGet(space, "condition")}');
    sb.writeln('Availability: ${safeGet(space, "availability")}');
    sb.writeln('Best Occupancy: ${safeGet(space, "bestOccupancy")}');
    sb.writeln('Lease Type: ${safeGet(space, "leaseType")}');
    sb.writeln('Ceiling Height: ${safeGet(space, "ceilingHeight")}');
    sb.writeln('Highlights: ${formatListField(space["highlights"])}');
    sb.writeln('Amenities: ${formatListField(space["amenities"])}');
    return sb.toString();
  }

  // Combine formatted strings for all available spaces
  return availableSpaces.map((space) => formatSpace(space)).join('\n');
}

String stringToImagePath(String url) {
  return url;
}

bool isMonthPassed(
  DateTime creationDate,
  DateTime currentDate,
) {
  // Calculate the difference in months and days
  int yearDifference = currentDate.year - creationDate.year;
  int monthDifference =
      currentDate.month - creationDate.month + (yearDifference * 12);
  int dayDifference = currentDate.day - creationDate.day;

  // Check if exactly one month has passed
  if (monthDifference == 1 && dayDifference == 0) {
    return true;
  }
  return false;
}

List<PropertyObjectStruct> getEmptyPropertyObjectList() {
  return [];
}

String generateImageHtml(String imageUrl) {
  return """
  <html style="height: 100%; margin: 0; padding: 0;">
    <head>
      <meta name="viewport" content="width=device-width, minimum-scale=0.1">
      <title>Image Viewer</title>
      <style>
        html, body {
          margin: 0;
          padding: 0;
          height: 100%;
          width: 100%;
          background-color: #0e0e0e; /* Dark background */
          overflow: hidden;
        }
        img {
          width: 100%;
          height: 100%;
          object-fit: cover; /* Ensures the image fills the space without gaps */
          display: block;
          margin: 0;
          cursor: zoom-in; /* Keeps cursor consistent */
          background-color: hsl(0, 0%, 90%);
          transition: background-color 300ms;
        }
      </style>
    </head>
    <body>
      <img src="$imageUrl" alt="Image" />
    </body>
  </html>
  """;
}
