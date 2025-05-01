import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/property_details/property_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'properties_map_widget.dart' show PropertiesMapWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PropertiesMapModel extends FlutterFlowModel<PropertiesMapWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - PropertyDetails] action in MapSample widget.
  String? propertyAddress;
  // Stores action output result for [Backend Call - API (Sale Details)] action in MapSample widget.
  ApiCallResponse? apiResultSaleDetails;
  // Stores action output result for [Backend Call - API (Lease Details)] action in MapSample widget.
  ApiCallResponse? apiResultLeaseDetails;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
