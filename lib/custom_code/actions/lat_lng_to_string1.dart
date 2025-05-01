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

import 'package:google_maps_flutter/google_maps_flutter.dart' as googleMaps;

String latLngToString1(LatLng latlng) {
  // Конвертируем в googleMaps.LatLng
  googleMaps.LatLng googleLatLng =
      googleMaps.LatLng(latlng.latitude, latlng.longitude);

  // Конвертируем в строку с нужным форматом
  return '${googleLatLng.latitude.toStringAsFixed(7)}, ${googleLatLng.longitude.toStringAsFixed(7)}';
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
