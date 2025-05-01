import '/components/point/point_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'comparelocations_widget.dart' show ComparelocationsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComparelocationsModel extends FlutterFlowModel<ComparelocationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Point component.
  late PointModel pointModel;

  @override
  void initState(BuildContext context) {
    pointModel = createModel(context, () => PointModel());
  }

  @override
  void dispose() {
    pointModel.dispose();
  }
}
