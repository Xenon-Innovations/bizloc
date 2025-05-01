import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_dialog_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'point_on_map_widget.dart' show PointOnMapWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PointOnMapModel extends FlutterFlowModel<PointOnMapWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - latLngToString1] action in Button widget.
  String? latlngstring;
  // Stores action output result for [Backend Call - API (reverseGeocode)] action in Button widget.
  ApiCallResponse? apiResulthxh;
  // Stores action output result for [Backend Call - API (Get Location Report)] action in Button widget.
  ApiCallResponse? reportResult;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReportsRecord? rep;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
