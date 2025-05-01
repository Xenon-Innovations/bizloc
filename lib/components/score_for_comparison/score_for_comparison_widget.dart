import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'score_for_comparison_model.dart';
export 'score_for_comparison_model.dart';

class ScoreForComparisonWidget extends StatefulWidget {
  const ScoreForComparisonWidget({
    super.key,
    required this.score,
  });

  final int? score;

  @override
  State<ScoreForComparisonWidget> createState() =>
      _ScoreForComparisonWidgetState();
}

class _ScoreForComparisonWidgetState extends State<ScoreForComparisonWidget> {
  late ScoreForComparisonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScoreForComparisonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      decoration: BoxDecoration(
        color: () {
          if (widget!.score! < 25) {
            return FlutterFlowTheme.of(context).accent2;
          } else if (widget!.score! < 50) {
            return FlutterFlowTheme.of(context).customColor1;
          } else if (widget!.score! < 75) {
            return FlutterFlowTheme.of(context).customColor1;
          } else {
            return Color(0xFFCAFFD5);
          }
        }(),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
          child: Text(
            '${widget!.score?.toString()}/100',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: () {
                    if (widget!.score! < 25) {
                      return FlutterFlowTheme.of(context).error;
                    } else if (widget!.score! < 50) {
                      return FlutterFlowTheme.of(context).orange;
                    } else if (widget!.score! < 75) {
                      return FlutterFlowTheme.of(context).orange;
                    } else {
                      return FlutterFlowTheme.of(context).green;
                    }
                  }(),
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ),
      ),
    );
  }
}
