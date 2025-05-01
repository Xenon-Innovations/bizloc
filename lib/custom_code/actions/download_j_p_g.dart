// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<FFUploadedFile> downloadJPG(String url) async {
  // Add your function code here!
  // Send HTTP GET request to the URL
  final response = await http.get(Uri.parse(url));

  // Check if the request was successful
  if (response.statusCode == 200) {
    // Return the image data as Uint8List
    return FFUploadedFile(name: 'image.jpg', bytes: response.bodyBytes);
  } else {
    throw Exception('Failed to download image: ${response.statusCode}');
  }
}
