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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'properties_map_model.dart';
export 'properties_map_model.dart';

class PropertiesMapWidget extends StatefulWidget {
  const PropertiesMapWidget({
    super.key,
    required this.centerLat,
    required this.centerLng,
    required this.propertyLocations,
  });

  final double? centerLat;
  final double? centerLng;
  final List<GoogleMapDataStruct>? propertyLocations;

  static String routeName = 'PropertiesMap';
  static String routePath = '/propertiesMap';

  @override
  State<PropertiesMapWidget> createState() => _PropertiesMapWidgetState();
}

class _PropertiesMapWidgetState extends State<PropertiesMapWidget> {
  late PropertiesMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PropertiesMapModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            icon: Icon(
              FFIcons.kback,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 20.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'View Properties Available',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.manrope(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: custom_widgets.MapSample(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                allowZoom: true,
                showZoomControls: false,
                showLocation: false,
                showCompass: false,
                showMapToolbar: false,
                showTraffic: false,
                centerLat: widget!.centerLat!,
                centerLng: widget!.centerLng!,
                mapData: widget!.propertyLocations,
                onMarkerTap: (currentLocation) async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return WebViewAware(
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: PropertyDetailsWidget(
                              property: currentLocation,
                            ),
                          ),
                        ),
                      );
                    },
                  ).then((value) =>
                      safeSetState(() => _model.propertyAddress = value));

                  if (_model.propertyAddress != null &&
                      _model.propertyAddress != '') {
                    if (currentLocation.type == 'sale') {
                      _model.apiResultSaleDetails =
                          await LoopnetGroup.saleDetailsCall.call(
                        listingId: currentLocation.listingId,
                      );

                      if ((_model.apiResultSaleDetails?.succeeded ?? true)) {
                        context.pushNamed(
                          PropertySaleDetailsPageWidget.routeName,
                          queryParameters: {
                            'address': serializeParam(
                              _model.propertyAddress,
                              ParamType.String,
                            ),
                            'listingId': serializeParam(
                              currentLocation.listingId,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: Text('Try again later'),
                                content: Text(
                                    'Sorry, server is not responding at the moment, please try again later'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    } else {
                      _model.apiResultLeaseDetails =
                          await LoopnetGroup.leaseDetailsCall.call(
                        listingId: currentLocation.listingId,
                      );

                      if ((_model.apiResultLeaseDetails?.succeeded ?? true)) {
                        context.pushNamed(
                          PropertyLeaseDetailsPageWidget.routeName,
                          queryParameters: {
                            'address': serializeParam(
                              _model.propertyAddress,
                              ParamType.String,
                            ),
                            'listingId': serializeParam(
                              currentLocation.listingId,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: Text('Try again later'),
                                content: Text(
                                    'Sorry, server is not responding at the moment, please try again later'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    }
                  }

                  safeSetState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
