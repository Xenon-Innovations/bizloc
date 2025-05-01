import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'full_result_widget.dart' show FullResultWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FullResultModel extends FlutterFlowModel<FullResultWidget> {
  ///  Local state fields for this page.

  List<PropertyObjectStruct> proprtyObjects = [];
  void addToProprtyObjects(PropertyObjectStruct item) =>
      proprtyObjects.add(item);
  void removeFromProprtyObjects(PropertyObjectStruct item) =>
      proprtyObjects.remove(item);
  void removeAtIndexFromProprtyObjects(int index) =>
      proprtyObjects.removeAt(index);
  void insertAtIndexInProprtyObjects(int index, PropertyObjectStruct item) =>
      proprtyObjects.insert(index, item);
  void updateProprtyObjectsAtIndex(
          int index, Function(PropertyObjectStruct) updateFn) =>
      proprtyObjects[index] = updateFn(proprtyObjects[index]);

  bool executingPropertiesAction = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Loopnet Property)] action in ReportWidget widget.
  ApiCallResponse? apiResultLoopnet;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
