import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'address_model.dart';
export 'address_model.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({super.key});

  static String routeName = 'Address';
  static String routePath = '/address';

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  late AddressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          backgroundColor: Color(0xFFF6F6F6),
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
            'Input address',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.manrope(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 2000),
                            () => safeSetState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: EdgeInsets.all(16.0),
                            suffixIcon: _model.textController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController?.clear();
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          textAlign: TextAlign.start,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    if (false)
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 16.0),
                                  child: Text(
                                    'LOS ANGELES CA 90079 6285',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: Color(0xFFD9D9D9),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 16.0),
                                  child: Text(
                                    'LOS ANGELES CA 90079 6285',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: Color(0xFFD9D9D9),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 16.0),
                                  child: Text(
                                    'LOS ANGELES CA 90079 6285',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: Color(0xFFD9D9D9),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 16.0),
                                  child: Text(
                                    'LOS ANGELES CA 90079 6285',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(PointOnMapWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FFIcons.kpoint,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 24.0,
                            ),
                            Text(
                              'Point on the map',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) => Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var _shouldSetState = false;
                      await actions.hideKeyboard();
                      _model.apiResultx9s = await GeocodeCall.call(
                        address: _model.textController.text,
                      );

                      _shouldSetState = true;
                      if ((_model.apiResultx9s?.succeeded ?? true)) {
                        if (GeocodeCall.status(
                              (_model.apiResultx9s?.jsonBody ?? ''),
                            ) !=
                            'OK') {
                          context.pushNamed(NoResultsWidget.routeName);

                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                        _model.reportResult = await GetLocationReportCall.call(
                          address: GeocodeCall.adress(
                            (_model.apiResultx9s?.jsonBody ?? ''),
                          ),
                        );

                        _shouldSetState = true;
                        if ((_model.reportResult?.succeeded ?? true)) {
                          var reportsRecordReference =
                              ReportsRecord.createDoc(currentUserReference!);
                          await reportsRecordReference.set({
                            ...createReportsRecordData(
                              adress: functions.parseLatLng(GeocodeCall.latlng(
                                (_model.apiResultx9s?.jsonBody ?? ''),
                              )),
                              adressStr: GeocodeCall.adress(
                                (_model.apiResultx9s?.jsonBody ?? ''),
                              ),
                              generated: false,
                              saved: false,
                              locationLat: GeocodeCall.lat(
                                (_model.apiResultx9s?.jsonBody ?? ''),
                              ),
                              locationLng: GeocodeCall.lng(
                                (_model.apiResultx9s?.jsonBody ?? ''),
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
                              populationChanges: updatePopulationChangesStruct(
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
                              ethnicComposition: updateEthnicCompositionStruct(
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
                                'competitors': getCompetitorListFirestoreData(
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
                              adress: functions.parseLatLng(GeocodeCall.latlng(
                                (_model.apiResultx9s?.jsonBody ?? ''),
                              )),
                              adressStr: GeocodeCall.adress(
                                (_model.apiResultx9s?.jsonBody ?? ''),
                              ),
                              generated: false,
                              saved: false,
                              locationLat: GeocodeCall.lat(
                                (_model.apiResultx9s?.jsonBody ?? ''),
                              ),
                              locationLng: GeocodeCall.lng(
                                (_model.apiResultx9s?.jsonBody ?? ''),
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
                              populationChanges: updatePopulationChangesStruct(
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
                              ethnicComposition: updateEthnicCompositionStruct(
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
                                'competitors': getCompetitorListFirestoreData(
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
                                      FocusScope.of(dialogContext).unfocus();
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
                                    FocusScope.of(dialogContext).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: AlertDialogWidget(
                                    title: 'Try again later',
                                    subtitle: 'Failed to geocode the input',
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
                    text: 'Check',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
