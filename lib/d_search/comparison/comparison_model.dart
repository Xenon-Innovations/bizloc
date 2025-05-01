import '/backend/backend.dart';
import '/components/score_for_comparison/score_for_comparison_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'comparison_widget.dart' show ComparisonWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ComparisonModel extends FlutterFlowModel<ComparisonWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel1;
  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel2;
  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel3;
  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel4;
  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel5;
  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel6;
  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel7;
  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel8;
  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel9;
  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel10;
  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel11;
  // Model for ScoreForComparison component.
  late ScoreForComparisonModel scoreForComparisonModel12;

  @override
  void initState(BuildContext context) {
    scoreForComparisonModel1 =
        createModel(context, () => ScoreForComparisonModel());
    scoreForComparisonModel2 =
        createModel(context, () => ScoreForComparisonModel());
    scoreForComparisonModel3 =
        createModel(context, () => ScoreForComparisonModel());
    scoreForComparisonModel4 =
        createModel(context, () => ScoreForComparisonModel());
    scoreForComparisonModel5 =
        createModel(context, () => ScoreForComparisonModel());
    scoreForComparisonModel6 =
        createModel(context, () => ScoreForComparisonModel());
    scoreForComparisonModel7 =
        createModel(context, () => ScoreForComparisonModel());
    scoreForComparisonModel8 =
        createModel(context, () => ScoreForComparisonModel());
    scoreForComparisonModel9 =
        createModel(context, () => ScoreForComparisonModel());
    scoreForComparisonModel10 =
        createModel(context, () => ScoreForComparisonModel());
    scoreForComparisonModel11 =
        createModel(context, () => ScoreForComparisonModel());
    scoreForComparisonModel12 =
        createModel(context, () => ScoreForComparisonModel());
  }

  @override
  void dispose() {
    scoreForComparisonModel1.dispose();
    scoreForComparisonModel2.dispose();
    scoreForComparisonModel3.dispose();
    scoreForComparisonModel4.dispose();
    scoreForComparisonModel5.dispose();
    scoreForComparisonModel6.dispose();
    scoreForComparisonModel7.dispose();
    scoreForComparisonModel8.dispose();
    scoreForComparisonModel9.dispose();
    scoreForComparisonModel10.dispose();
    scoreForComparisonModel11.dispose();
    scoreForComparisonModel12.dispose();
  }
}
