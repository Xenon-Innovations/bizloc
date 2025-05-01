// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:ui';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    as google_maps_flutter;
import '/flutter_flow/lat_lng.dart' as latlng;
import 'dart:async';
export 'dart:async' show Completer;
export 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
export '/flutter_flow/lat_lng.dart' show LatLng;

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

class MapSample extends StatefulWidget {
  const MapSample({
    Key? key,
    this.width,
    this.height,
    this.mapData,
    this.allowZoom = true,
    this.showZoomControls = true,
    this.showLocation = true,
    this.showCompass = false,
    this.showMapToolbar = false,
    this.showTraffic = false,
    this.centerLat = 0.0,
    this.centerLng = 0.0,
    this.onMarkerTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<GoogleMapDataStruct>? mapData;
  final bool allowZoom;
  final bool showZoomControls;
  final bool showLocation;
  final bool showCompass;
  final bool showMapToolbar;
  final bool showTraffic;
  final double centerLat;
  final double centerLng;
  final Future Function(GoogleMapDataStruct currentLocation)? onMarkerTap;

  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  final Completer<google_maps_flutter.GoogleMapController> _controller =
      Completer();
  final Map<String, google_maps_flutter.BitmapDescriptor> _customIcons = {};
  Set<google_maps_flutter.Marker> _markers = {};

  late google_maps_flutter.LatLng _center;

  @override
  void initState() {
    super.initState();

    _center = google_maps_flutter.LatLng(widget.centerLat, widget.centerLng);

    _loadMarkerIcons();
  }

  Future<void> _loadMarkerIcons() async {
    Set<String> uniqueIconPaths =
        widget.mapData?.map((data) => data.iconPath).toSet() ??
            {}; // Extract unique icon paths

    for (String path in uniqueIconPaths) {
      if (path.isNotEmpty) {
        google_maps_flutter.BitmapDescriptor descriptor =
            await google_maps_flutter.BitmapDescriptor.asset(
                const ImageConfiguration(devicePixelRatio: 2.5),
                "assets/images/$path");
        _customIcons[path] = descriptor;
      }
    }

    _updateMarkers(); // Update markers once icons are loaded
  }

  void _updateMarkers() {
    setState(() {
      _markers = _createMarkers();
    });
  }

  void _onMapCreated(google_maps_flutter.GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: google_maps_flutter.GoogleMap(
        onMapCreated: _onMapCreated,
        zoomGesturesEnabled: widget.allowZoom,
        zoomControlsEnabled: widget.showZoomControls,
        myLocationEnabled: widget.showLocation,
        compassEnabled: widget.showCompass,
        mapToolbarEnabled: widget.showMapToolbar,
        trafficEnabled: widget.showTraffic,
        initialCameraPosition: google_maps_flutter.CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: _markers,
      ),
    );
  }

  Set<google_maps_flutter.Marker> _createMarkers() {
    var tmp = <google_maps_flutter.Marker>{};

    // Assuming widget.mapData is a list of objects that contain a 'latLng' property of type latlng.LatLng
    widget.mapData?.forEach((mapData) {
      // Directly use the latlng.LatLng object
      final latlng.LatLng coordinates = mapData.latLng as latlng.LatLng;

      // Convert to google_maps_flutter.LatLng
      final google_maps_flutter.LatLng googleMapsLatLng =
          google_maps_flutter.LatLng(
              coordinates.latitude, coordinates.longitude);

      google_maps_flutter.BitmapDescriptor icon =
          _customIcons[mapData.iconPath] ??
              google_maps_flutter.BitmapDescriptor.defaultMarker;

      // Create and add the marker
      final google_maps_flutter.Marker marker = google_maps_flutter.Marker(
        markerId: google_maps_flutter.MarkerId(mapData.title),
        position: googleMapsLatLng,
        icon: icon,
        infoWindow: google_maps_flutter.InfoWindow(
            title: mapData.title, snippet: mapData.description),
        onTap: () {
          // Call the onMarkerTap callback if it is provided
          if (widget.onMarkerTap != null) {
            widget.onMarkerTap!(mapData);
          }
        },
      );

      tmp.add(marker);
    });

    return tmp;
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
