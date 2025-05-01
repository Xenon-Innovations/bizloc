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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'point_on_map_model.dart';
export 'point_on_map_model.dart';

class PointOnMapWidget extends StatefulWidget {
  const PointOnMapWidget({super.key});

  static String routeName = 'PointOnMap';
  static String routePath = '/pointOnMap';

  @override
  State<PointOnMapWidget> createState() => _PointOnMapWidgetState();
}

class _PointOnMapWidgetState extends State<PointOnMapWidget> {
  late PointOnMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PointOnMapModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
          title: SelectionArea(
              child: Text(
            'Point on the map',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.manrope(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: Colors.black,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          )),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              FlutterFlowGoogleMap(
                controller: _model.googleMapsController,
                onCameraIdle: (latLng) =>
                    safeSetState(() => _model.googleMapsCenter = latLng),
                initialLocation: _model.googleMapsCenter ??=
                    currentUserLocationValue!,
                markerColor: GoogleMarkerColor.violet,
                mapType: MapType.normal,
                style: GoogleMapStyle.standard,
                initialZoom: 15.0,
                allowInteraction: true,
                allowZoom: true,
                showZoomControls: false,
                showLocation: true,
                showCompass: false,
                showMapToolbar: false,
                showTraffic: false,
                centerMapOnMarkerTap: false,
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          _model.latlngstring = await actions.latLngToString1(
                            _model.googleMapsCenter!,
                          );
                          _shouldSetState = true;
                          _model.apiResulthxh = await ReverseGeocodeCall.call(
                            latlng: _model.latlngstring,
                          );

                          _shouldSetState = true;
                          if ((_model.apiResulthxh?.succeeded ?? true)) {
                            if (ReverseGeocodeCall.status(
                                  (_model.apiResulthxh?.jsonBody ?? ''),
                                ) !=
                                'OK') {
                              context.pushNamed(NoResultsWidget.routeName);

                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                            _model.reportResult =
                                await GetLocationReportCall.call(
                              address: ReverseGeocodeCall.address(
                                (_model.apiResulthxh?.jsonBody ?? ''),
                              ),
                            );

                            _shouldSetState = true;
                            if ((_model.reportResult?.succeeded ?? true)) {
                              var reportsRecordReference =
                                  ReportsRecord.createDoc(
                                      currentUserReference!);
                              await reportsRecordReference.set({
                                ...createReportsRecordData(
                                  adress: functions
                                      .parseLatLng(ReverseGeocodeCall.latlng(
                                    (_model.apiResulthxh?.jsonBody ?? ''),
                                  )),
                                  adressStr: ReverseGeocodeCall.address(
                                    (_model.apiResulthxh?.jsonBody ?? ''),
                                  ),
                                  generated: false,
                                  saved: false,
                                  locationLat: ReverseGeocodeCall.locLat(
                                    (_model.apiResulthxh?.jsonBody ?? ''),
                                  ),
                                  locationLng: ReverseGeocodeCall.locLng(
                                    (_model.apiResulthxh?.jsonBody ?? ''),
                                  ),
                                  population: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['population']''',
                                  ),
                                  populationData: updatePopulationDataStruct(
                                    PopulationDataStruct(
                                      year2017: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2017']''',
                                      ),
                                      year2018: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2018']''',
                                      ),
                                      year2019: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2019']''',
                                      ),
                                      year2020: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2020']''',
                                      ),
                                      year2021: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2021']''',
                                      ),
                                      year2022: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2022']''',
                                      ),
                                    ),
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  populationChanges:
                                      updatePopulationChangesStruct(
                                    PopulationChangesStruct(
                                      year2017: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2017']''',
                                      ),
                                      year2018: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2018']''',
                                      ),
                                      year2019: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2019']''',
                                      ),
                                      year2020: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2020']''',
                                      ),
                                      year2021: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2021']''',
                                      ),
                                      year2022: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2022']''',
                                      ),
                                    ),
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  medianAge: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['medianAge']''',
                                  ).toString(),
                                  ethnicComposition:
                                      updateEthnicCompositionStruct(
                                    EthnicCompositionStruct(
                                      white: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['ethnicComposition']['white']''',
                                      ),
                                      black: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['ethnicComposition']['black']''',
                                      ),
                                      latino: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['ethnicComposition']['latino']''',
                                      ),
                                      asian: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['ethnicComposition']['asian']''',
                                      ),
                                      other: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['ethnicComposition']['other']''',
                                      ),
                                    ),
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  householdIncome: updateHouseholdIncomeStruct(
                                    HouseholdIncomeStruct(
                                      pct0to40K: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['householdIncomeDataPercentage']['from0to40']''',
                                      ),
                                      pct60Kto80K: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['householdIncomeDataPercentage']['from60to80']''',
                                      ),
                                      pct80KandHigher: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['householdIncomeDataPercentage']['from80']''',
                                      ),
                                      pct40Kto60K: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['householdIncomeDataPercentage']['from40to60']''',
                                      ),
                                    ),
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  crimeData: updateCrimeDataStruct(
                                    CrimeDataStruct.maybeFromMap(getJsonField(
                                      (_model.reportResult?.jsonBody ?? ''),
                                      r'''$['data']['crimeData']''',
                                    )),
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  crimeScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['crimeScore']''',
                                  ),
                                  crimeReport: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['crimeReport']''',
                                  ).toString(),
                                  demographicScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['demographicScore']''',
                                  ),
                                  populationScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['populationScore']''',
                                  ),
                                  populationReport: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['populationReport']''',
                                  ).toString(),
                                  parkingScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['parkingScore']''',
                                  ),
                                  parkingReport: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['parkingReport']''',
                                  ).toString(),
                                  transitScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['transitScore']''',
                                  ),
                                  transitReport: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['transitReport']''',
                                  ).toString(),
                                  locationScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['locationScore']''',
                                  ),
                                  competitorsScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['competitorsScore']''',
                                  ),
                                  zipCode: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['zipCode']''',
                                  ).toString(),
                                ),
                                ...mapToFirestore(
                                  {
                                    'competitors':
                                        getCompetitorListFirestoreData(
                                      (getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['competitorsData']''',
                                        true,
                                      )
                                                  ?.toList()
                                                  .map<CompetitorStruct?>(
                                                      CompetitorStruct.maybeFromMap)
                                                  .toList()
                                              as Iterable<CompetitorStruct?>)
                                          .withoutNulls,
                                    ),
                                    'availableProperty':
                                        getPropertyObjectListFirestoreData(
                                      functions.getEmptyPropertyObjectList(),
                                    ),
                                  },
                                ),
                              });
                              _model.rep = ReportsRecord.getDocumentFromData({
                                ...createReportsRecordData(
                                  adress: functions
                                      .parseLatLng(ReverseGeocodeCall.latlng(
                                    (_model.apiResulthxh?.jsonBody ?? ''),
                                  )),
                                  adressStr: ReverseGeocodeCall.address(
                                    (_model.apiResulthxh?.jsonBody ?? ''),
                                  ),
                                  generated: false,
                                  saved: false,
                                  locationLat: ReverseGeocodeCall.locLat(
                                    (_model.apiResulthxh?.jsonBody ?? ''),
                                  ),
                                  locationLng: ReverseGeocodeCall.locLng(
                                    (_model.apiResulthxh?.jsonBody ?? ''),
                                  ),
                                  population: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['population']''',
                                  ),
                                  populationData: updatePopulationDataStruct(
                                    PopulationDataStruct(
                                      year2017: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2017']''',
                                      ),
                                      year2018: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2018']''',
                                      ),
                                      year2019: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2019']''',
                                      ),
                                      year2020: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2020']''',
                                      ),
                                      year2021: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2021']''',
                                      ),
                                      year2022: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationData']['2022']''',
                                      ),
                                    ),
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  populationChanges:
                                      updatePopulationChangesStruct(
                                    PopulationChangesStruct(
                                      year2017: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2017']''',
                                      ),
                                      year2018: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2018']''',
                                      ),
                                      year2019: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2019']''',
                                      ),
                                      year2020: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2020']''',
                                      ),
                                      year2021: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2021']''',
                                      ),
                                      year2022: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['populationChanges']['2022']''',
                                      ),
                                    ),
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  medianAge: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['medianAge']''',
                                  ).toString(),
                                  ethnicComposition:
                                      updateEthnicCompositionStruct(
                                    EthnicCompositionStruct(
                                      white: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['ethnicComposition']['white']''',
                                      ),
                                      black: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['ethnicComposition']['black']''',
                                      ),
                                      latino: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['ethnicComposition']['latino']''',
                                      ),
                                      asian: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['ethnicComposition']['asian']''',
                                      ),
                                      other: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['ethnicComposition']['other']''',
                                      ),
                                    ),
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  householdIncome: updateHouseholdIncomeStruct(
                                    HouseholdIncomeStruct(
                                      pct0to40K: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['householdIncomeDataPercentage']['from0to40']''',
                                      ),
                                      pct60Kto80K: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['householdIncomeDataPercentage']['from60to80']''',
                                      ),
                                      pct80KandHigher: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['householdIncomeDataPercentage']['from80']''',
                                      ),
                                      pct40Kto60K: getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['householdIncomeDataPercentage']['from40to60']''',
                                      ),
                                    ),
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  crimeData: updateCrimeDataStruct(
                                    CrimeDataStruct.maybeFromMap(getJsonField(
                                      (_model.reportResult?.jsonBody ?? ''),
                                      r'''$['data']['crimeData']''',
                                    )),
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  crimeScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['crimeScore']''',
                                  ),
                                  crimeReport: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['crimeReport']''',
                                  ).toString(),
                                  demographicScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['demographicScore']''',
                                  ),
                                  populationScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['populationScore']''',
                                  ),
                                  populationReport: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['populationReport']''',
                                  ).toString(),
                                  parkingScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['parkingScore']''',
                                  ),
                                  parkingReport: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['parkingReport']''',
                                  ).toString(),
                                  transitScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['transitScore']''',
                                  ),
                                  transitReport: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['transitReport']''',
                                  ).toString(),
                                  locationScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['locationScore']''',
                                  ),
                                  competitorsScore: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['competitorsScore']''',
                                  ),
                                  zipCode: getJsonField(
                                    (_model.reportResult?.jsonBody ?? ''),
                                    r'''$['data']['zipCode']''',
                                  ).toString(),
                                ),
                                ...mapToFirestore(
                                  {
                                    'competitors':
                                        getCompetitorListFirestoreData(
                                      (getJsonField(
                                        (_model.reportResult?.jsonBody ?? ''),
                                        r'''$['data']['competitorsData']''',
                                        true,
                                      )
                                                  ?.toList()
                                                  .map<CompetitorStruct?>(
                                                      CompetitorStruct.maybeFromMap)
                                                  .toList()
                                              as Iterable<CompetitorStruct?>)
                                          .withoutNulls,
                                    ),
                                    'availableProperty':
                                        getPropertyObjectListFirestoreData(
                                      functions.getEmptyPropertyObjectList(),
                                    ),
                                  },
                                ),
                              }, reportsRecordReference);
                              _shouldSetState = true;

                              context.pushNamed(
                                ResultsWidget.routeName,
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.rep?.reference,
                                    ParamType.DocumentReference,
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
                          if (_shouldSetState) safeSetState(() {});
                        },
                        text: 'Check',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 36.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'assets/images/fi_149059.svg',
                        width: 72.0,
                        height: 72.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
