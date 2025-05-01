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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'full_result_model.dart';
export 'full_result_model.dart';

class FullResultWidget extends StatefulWidget {
  const FullResultWidget({
    super.key,
    required this.reportRef,
  });

  final DocumentReference? reportRef;

  static String routeName = 'FullResult';
  static String routePath = '/fullResult';

  @override
  State<FullResultWidget> createState() => _FullResultWidgetState();
}

class _FullResultWidgetState extends State<FullResultWidget> {
  late FullResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FullResultModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ReportsRecord>(
      stream: ReportsRecord.getDocument(widget!.reportRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final fullResultReportsRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                FFIcons.kback,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                context.pop();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Back',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (fullResultReportsRecord.saved) {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await widget!.reportRef!
                                    .update(createReportsRecordData(
                                  saved: false,
                                ));
                              },
                              text: 'Location saved',
                              icon: Icon(
                                FFIcons.kbookmark2,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 6.0, 12.0, 6.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xD21169C8),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await widget!.reportRef!
                                    .update(createReportsRecordData(
                                  saved: true,
                                ));
                              },
                              text: 'Save location',
                              icon: Icon(
                                FFIcons.kbookmark2,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 6.0, 12.0, 6.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFECECEC),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) => custom_widgets.ReportWidget(
                          width: double.infinity,
                          height: 500.0,
                          icon: Icon(
                            FFIcons.klink,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 20.0,
                          ),
                          reportDocument: fullResultReportsRecord,
                          propertiesButtonAction: () async {
                            var _shouldSetState = false;
                            if (_model.executingPropertiesAction) {
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }

                            _model.executingPropertiesAction = true;
                            safeSetState(() {});
                            if (fullResultReportsRecord
                                    .availableProperty.length >
                                0) {
                              context.pushNamed(
                                PropertiesMapWidget.routeName,
                                queryParameters: {
                                  'centerLat': serializeParam(
                                    fullResultReportsRecord.locationLat,
                                    ParamType.double,
                                  ),
                                  'centerLng': serializeParam(
                                    fullResultReportsRecord.locationLng,
                                    ParamType.double,
                                  ),
                                  'propertyLocations': serializeParam(
                                    functions.mapPropertyObjectsToLocations(
                                        fullResultReportsRecord
                                            .availableProperty
                                            .toList()),
                                    ParamType.DataStruct,
                                    isList: true,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              _model.apiResultLoopnet =
                                  await GetLoopnetPropertyCall.call(
                                zipCode: fullResultReportsRecord.zipCode,
                              );

                              _shouldSetState = true;
                              if ((_model.apiResultLoopnet?.succeeded ??
                                  true)) {
                                _model.proprtyObjects = functions
                                    .parsePropertiesFromJson(
                                        (_model.apiResultLoopnet?.jsonBody ??
                                            ''))
                                    .toList()
                                    .cast<PropertyObjectStruct>();
                                safeSetState(() {});
                                unawaited(
                                  () async {
                                    await fullResultReportsRecord.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'availableProperty':
                                              getPropertyObjectListFirestoreData(
                                            _model.proprtyObjects,
                                          ),
                                        },
                                      ),
                                    });
                                  }(),
                                );

                                context.pushNamed(
                                  PropertiesMapWidget.routeName,
                                  queryParameters: {
                                    'centerLat': serializeParam(
                                      fullResultReportsRecord.locationLat,
                                      ParamType.double,
                                    ),
                                    'centerLng': serializeParam(
                                      fullResultReportsRecord.locationLng,
                                      ParamType.double,
                                    ),
                                    'propertyLocations': serializeParam(
                                      functions.mapPropertyObjectsToLocations(
                                          _model.proprtyObjects.toList()),
                                      ParamType.DataStruct,
                                      isList: true,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: AlertDialogWidget(
                                            title: 'Try again later',
                                            subtitle:
                                                'Sorry, server is not responding at the moment, please try again later',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            }

                            _model.executingPropertiesAction = false;
                            safeSetState(() {});
                            if (_shouldSetState) safeSetState(() {});
                          },
                        ),
                      ),
                    ].addToEnd(SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
