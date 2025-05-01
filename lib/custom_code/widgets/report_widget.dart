// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
//import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({
    super.key,
    this.width,
    this.height,
    required this.reportDocument,
    required this.icon,
    required this.propertiesButtonAction,
  });

  final double? width;
  final double? height;
  final ReportsRecord reportDocument;
  final Widget icon;
  final Future Function() propertiesButtonAction;

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  //GlobalKey globalKey = GlobalKey();
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> createAndSetPDF() async {
    //RenderRepaintBoundary boundary =
    //    globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    //ui.Image image = await boundary.toImage();
    //ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    //Uint8List imageBytes = byteData!.buffer.asUint8List();

    Uint8List? imageBytesOrNull = await screenshotController.capture();
    Uint8List imageBytes =
        imageBytesOrNull == null ? Uint8List(1) : imageBytesOrNull;
    final pdf = pw.Document();
    final imagePDF = pw.MemoryImage(imageBytes);
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Image(imagePDF),
        ),
      ),
    );

    final Uint8List pdfBytes = await pdf.save();
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;
    final String pdfPath = '$tempPath/${widget.reportDocument.adressStr}.pdf';
    final File file = File(pdfPath);
    await file.writeAsBytes(pdfBytes);
    OpenFile.open(pdfPath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Screenshot(
          controller: screenshotController,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: Text(
                'Location score',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      fontSize: 24,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
              child: CircularPercentIndicator(
                percent: widget.reportDocument.locationScore / 100,
                radius: 60,
                lineWidth: 12,
                animation: true,
                animateFromLastPercent: true,
                progressColor: () {
                  if (widget.reportDocument.locationScore < 25) {
                    return FlutterFlowTheme.of(context).error;
                  } else if (widget.reportDocument.locationScore < 50) {
                    return FlutterFlowTheme.of(context).orange;
                  } else if (widget.reportDocument.locationScore < 75) {
                    return FlutterFlowTheme.of(context).warning;
                  } else {
                    return FlutterFlowTheme.of(context).green;
                  }
                }(),
                backgroundColor: FlutterFlowTheme.of(context).gray100,
                center: Text(
                  widget.reportDocument.locationScore.toString(),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Manrope',
                        color: () {
                          if (widget.reportDocument.locationScore < 25) {
                            return FlutterFlowTheme.of(context).error;
                          } else if (widget.reportDocument.locationScore < 50) {
                            return FlutterFlowTheme.of(context).orange;
                          } else if (widget.reportDocument.locationScore < 75) {
                            return FlutterFlowTheme.of(context).warning;
                          } else {
                            return FlutterFlowTheme.of(context).green;
                          }
                        }(),
                        fontSize: 32,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Demographic Breakdown',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        fontSize: 18,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  '${widget.reportDocument.demographicScore.toString()}/100',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: () {
                          if (widget.reportDocument.demographicScore < 25) {
                            return FlutterFlowTheme.of(context).error;
                          } else if (widget.reportDocument.demographicScore <
                              50) {
                            return FlutterFlowTheme.of(context).orange;
                          } else if (widget.reportDocument.demographicScore <
                              75) {
                            return FlutterFlowTheme.of(context).warning;
                          } else {
                            return FlutterFlowTheme.of(context).green;
                          }
                        }(),
                        fontSize: 16,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Image.network(
                'https://maps.googleapis.com/maps/api/staticmap?center=${widget.reportDocument.locationLat},${widget.reportDocument.locationLng}&zoom=14&size=600x400&maptype=roadmap&markers=icon:https://storage.googleapis.com/biz-loc-blmajx.appspot.com/location_marker.png%7C${widget.reportDocument.locationLat},${widget.reportDocument.locationLng}&key=AIzaSyBNFc7xKlqh4eb6fmYBTEhWmZQUYt1Uf4g',
                width: MediaQuery.sizeOf(context).width,
                height: 388,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Population',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 16,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.reportDocument.population.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Median age',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.reportDocument.medianAge.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 32,
              thickness: 1,
              color: FlutterFlowTheme.of(context).gray200,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ethnicity mix',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        fontSize: 18,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
              child: CustomPieChart(width: 215, height: 215, data: [
                widget.reportDocument.ethnicComposition.white,
                widget.reportDocument.ethnicComposition.black,
                widget.reportDocument.ethnicComposition.latino,
                widget.reportDocument.ethnicComposition.asian,
                widget.reportDocument.ethnicComposition.other,
              ]),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).blue,
                      ),
                    ),
                    Text(
                      'White',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(width: 8)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).orange2,
                      ),
                    ),
                    Text(
                      'Black',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).purple,
                      ),
                    ),
                    Text(
                      'Latino',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(width: 8)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).green2,
                      ),
                    ),
                    Text(
                      'Asian',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(width: 8)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).error,
                      ),
                    ),
                    Text(
                      'Other',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(width: 8)),
                ),
              ],
            ),
            Divider(
              height: 32,
              thickness: 1,
              color: FlutterFlowTheme.of(context).gray200,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Population analysis',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${widget.reportDocument.populationScore.toString()}/100',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: () {
                            if (widget.reportDocument.populationScore < 25) {
                              return FlutterFlowTheme.of(context).error;
                            } else if (widget.reportDocument.populationScore <
                                50) {
                              return FlutterFlowTheme.of(context).orange;
                            } else if (widget.reportDocument.populationScore <
                                75) {
                              return FlutterFlowTheme.of(context).warning;
                            } else {
                              return FlutterFlowTheme.of(context).green;
                            }
                          }(),
                          fontSize: 16,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Text(
                  widget.reportDocument.populationReport,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        fontSize: 16,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Population change ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Container(
                width: double.infinity,
                height: 232,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        StyledVerticalDivider(
                          width: 11,
                          color: FlutterFlowTheme.of(context).grey500,
                          lineStyle: DividerLineStyle.dashed,
                        ),
                        StyledVerticalDivider(
                          width: 11,
                          color: FlutterFlowTheme.of(context).grey500,
                          lineStyle: DividerLineStyle.dashed,
                        ),
                        StyledVerticalDivider(
                          width: 11,
                          color: FlutterFlowTheme.of(context).grey500,
                          lineStyle: DividerLineStyle.dashed,
                        ),
                        StyledVerticalDivider(
                          width: 11,
                          color: FlutterFlowTheme.of(context).grey500,
                          lineStyle: DividerLineStyle.dashed,
                        ),
                        StyledVerticalDivider(
                          width: 22,
                          color: FlutterFlowTheme.of(context).grey500,
                          lineStyle: DividerLineStyle.dashed,
                        ),
                      ].divide(SizedBox(width: 53)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 1,
                          height: 232,
                          decoration: BoxDecoration(
                            color: Color(0xFFC7C7CB),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.88,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 6),
                                      child: Text(
                                        '2018',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 6),
                                      child: Text(
                                        '${widget.reportDocument.populationChanges.year2018 >= 0 ? '+' : ''}${widget.reportDocument.populationChanges.year2018.toString()}%',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: widget
                                                          .reportDocument
                                                          .populationChanges
                                                          .year2018 >=
                                                      0
                                                  ? Color(0xFF19DC7F)
                                                  : FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: LinearPercentIndicator(
                                percent: widget.reportDocument.populationData
                                        .year2018 /
                                    findMaxOfFive(
                                        widget.reportDocument.populationData
                                            .year2018,
                                        widget.reportDocument.populationData
                                            .year2019,
                                        widget.reportDocument.populationData
                                            .year2020,
                                        widget.reportDocument.populationData
                                            .year2021,
                                        widget.reportDocument.populationData
                                            .year2022),
                                width: MediaQuery.sizeOf(context).width * 0.88,
                                lineHeight: 12,
                                animation: false,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).accent1,
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.88,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 6),
                                      child: Text(
                                        '2019',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 6),
                                      child: Text(
                                        '${widget.reportDocument.populationChanges.year2019 >= 0 ? '+' : ''}${widget.reportDocument.populationChanges.year2019.toString()}%',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: widget
                                                          .reportDocument
                                                          .populationChanges
                                                          .year2019 >=
                                                      0
                                                  ? Color(0xFF19DC7F)
                                                  : FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: LinearPercentIndicator(
                                percent: widget.reportDocument.populationData
                                        .year2019 /
                                    findMaxOfFive(
                                        widget.reportDocument.populationData
                                            .year2018,
                                        widget.reportDocument.populationData
                                            .year2019,
                                        widget.reportDocument.populationData
                                            .year2020,
                                        widget.reportDocument.populationData
                                            .year2021,
                                        widget.reportDocument.populationData
                                            .year2022),
                                width: MediaQuery.sizeOf(context).width * 0.88,
                                lineHeight: 12,
                                animation: false,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).accent1,
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.88,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 6),
                                      child: Text(
                                        '2020',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 6),
                                      child: Text(
                                        '${widget.reportDocument.populationChanges.year2020 >= 0 ? '+' : ''}${widget.reportDocument.populationChanges.year2020.toString()}%',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: widget
                                                          .reportDocument
                                                          .populationChanges
                                                          .year2020 >=
                                                      0
                                                  ? Color(0xFF19DC7F)
                                                  : FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: LinearPercentIndicator(
                                percent: widget.reportDocument.populationData
                                        .year2020 /
                                    findMaxOfFive(
                                        widget.reportDocument.populationData
                                            .year2018,
                                        widget.reportDocument.populationData
                                            .year2019,
                                        widget.reportDocument.populationData
                                            .year2020,
                                        widget.reportDocument.populationData
                                            .year2021,
                                        widget.reportDocument.populationData
                                            .year2022),
                                width: MediaQuery.sizeOf(context).width * 0.88,
                                lineHeight: 12,
                                animation: false,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).accent1,
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.88,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 6),
                                      child: Text(
                                        '2021',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 6),
                                      child: Text(
                                        '${widget.reportDocument.populationChanges.year2021 >= 0 ? '+' : ''}${widget.reportDocument.populationChanges.year2021.toString()}%',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: widget
                                                          .reportDocument
                                                          .populationChanges
                                                          .year2021 >=
                                                      0
                                                  ? Color(0xFF19DC7F)
                                                  : FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: LinearPercentIndicator(
                                percent: widget.reportDocument.populationData
                                        .year2021 /
                                    findMaxOfFive(
                                        widget.reportDocument.populationData
                                            .year2018,
                                        widget.reportDocument.populationData
                                            .year2019,
                                        widget.reportDocument.populationData
                                            .year2020,
                                        widget.reportDocument.populationData
                                            .year2021,
                                        widget.reportDocument.populationData
                                            .year2022),
                                width: MediaQuery.sizeOf(context).width * 0.88,
                                lineHeight: 12,
                                animation: false,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).accent1,
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.88,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 6),
                                      child: Text(
                                        '2022',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 6),
                                      child: Text(
                                        '${widget.reportDocument.populationChanges.year2022 >= 0 ? '+' : ''}${widget.reportDocument.populationChanges.year2022.toString()}%',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: widget
                                                          .reportDocument
                                                          .populationChanges
                                                          .year2022 >=
                                                      0
                                                  ? Color(0xFF19DC7F)
                                                  : FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: LinearPercentIndicator(
                                percent: widget.reportDocument.populationData
                                        .year2022 /
                                    findMaxOfFive(
                                        widget.reportDocument.populationData
                                            .year2018,
                                        widget.reportDocument.populationData
                                            .year2019,
                                        widget.reportDocument.populationData
                                            .year2020,
                                        widget.reportDocument.populationData
                                            .year2021,
                                        widget.reportDocument.populationData
                                            .year2022),
                                width: MediaQuery.sizeOf(context).width * 0.88,
                                lineHeight: 12,
                                animation: false,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).accent1,
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Builder(
                builder: (context) {
                  final pct = calculatePercentiles(findMaxOfFive(
                          widget.reportDocument.populationData.year2018,
                          widget.reportDocument.populationData.year2019,
                          widget.reportDocument.populationData.year2020,
                          widget.reportDocument.populationData.year2021,
                          widget.reportDocument.populationData.year2022))
                      .toList();
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(pct.length, (pctIndex) {
                      final pctItem = pct[pctIndex];
                      return Text(
                        pctItem.toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: Color(0xFF8E8E93),
                              fontSize: 12,
                              letterSpacing: 0.0,
                            ),
                      );
                    }).divide(SizedBox(width: 10)),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Average household income',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
              child: CustomPieChart(width: 215, height: 215, data: [
                widget.reportDocument.householdIncome.pct0to40K,
                widget.reportDocument.householdIncome.pct40Kto60K,
                widget.reportDocument.householdIncome.pct60Kto80K,
                widget.reportDocument.householdIncome.pct80KandHigher,
              ]),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).blue,
                        ),
                      ),
                      Text(
                        '\$0 – \$40,000',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 12,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(width: 8)),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).orange2,
                        ),
                      ),
                      Text(
                        '\$40,001 – \$60,000',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 12,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(width: 8)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).purple,
                          ),
                        ),
                        Text(
                          '\$60,001 – \$80,000',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    fontSize: 12,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(SizedBox(width: 8)),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).green2,
                          ),
                        ),
                        Text(
                          '\$80,001 and higher',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    fontSize: 12,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(SizedBox(width: 8)),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 32,
              thickness: 1,
              color: FlutterFlowTheme.of(context).gray200,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Crime Rate',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${widget.reportDocument.crimeScore.toString()}/100',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: () {
                            if (widget.reportDocument.crimeScore < 25) {
                              return FlutterFlowTheme.of(context).error;
                            } else if (widget.reportDocument.crimeScore < 50) {
                              return FlutterFlowTheme.of(context).orange;
                            } else if (widget.reportDocument.crimeScore < 75) {
                              return FlutterFlowTheme.of(context).warning;
                            } else {
                              return FlutterFlowTheme.of(context).green;
                            }
                          }(),
                          fontSize: 16,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Text(
                  widget.reportDocument.crimeReport,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        fontSize: 16,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Mortality Index',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.reportDocument.crimeData.mortalityIndex.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Murder Index',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.reportDocument.crimeData.murderIndex.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Forcible Rape Index',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.reportDocument.crimeData.forcibleRapeIndex
                          .toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Forcible Robbery Index',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.reportDocument.crimeData.forcibleRobberyIndex
                          .toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Aggravated Assault Index',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.reportDocument.crimeData.aggravatedAssaultIndex
                          .toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Burglary Index',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.reportDocument.crimeData.burglaryIndex.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Larceny Index',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.reportDocument.crimeData.larcenyIndex.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Motor Vehicle Theft Index',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.reportDocument.crimeData.motorVehicleTheftIndex
                          .toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Crime Index',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.reportDocument.crimeData.crimeIndex.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Competitor Insights',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${widget.reportDocument.competitorsScore.toString()}/100',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: () {
                            if (widget.reportDocument.competitorsScore < 25) {
                              return FlutterFlowTheme.of(context).error;
                            } else if (widget.reportDocument.competitorsScore <
                                50) {
                              return FlutterFlowTheme.of(context).orange;
                            } else if (widget.reportDocument.competitorsScore <
                                75) {
                              return FlutterFlowTheme.of(context).warning;
                            } else {
                              return FlutterFlowTheme.of(context).green;
                            }
                          }(),
                          fontSize: 16,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 16,
              thickness: 1,
              color: FlutterFlowTheme.of(context).grey500,
            ),
            Builder(
              builder: (context) {
                final competitor = widget.reportDocument.competitors.toList();
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(competitor.length, (competitorIndex) {
                    final competitorItem = competitor[competitorIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Text(
                            competitorItem.name,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  fontSize: 17,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'Distance',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 16,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  '${competitorItem.distanceFt.toString()} F',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 16,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'Arrival time',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 16,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  '${competitorItem.walkingTimeMin.toString()} min walk',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 16,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'Square Footage',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 16,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  '${competitorItem.buildingSizeSqft.toString()} SF',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 16,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 16,
                          thickness: 1,
                          color: FlutterFlowTheme.of(context).grey500,
                        ),
                      ],
                    );
                  }),
                );
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Parking availability',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${widget.reportDocument.parkingScore.toString()}/100',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: () {
                            if (widget.reportDocument.parkingScore < 25) {
                              return FlutterFlowTheme.of(context).error;
                            } else if (widget.reportDocument.parkingScore <
                                50) {
                              return FlutterFlowTheme.of(context).orange;
                            } else if (widget.reportDocument.parkingScore <
                                75) {
                              return FlutterFlowTheme.of(context).warning;
                            } else {
                              return FlutterFlowTheme.of(context).green;
                            }
                          }(),
                          fontSize: 16,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Text(
                  widget.reportDocument.parkingReport,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        fontSize: 16,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transit availability',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${widget.reportDocument.transitScore.toString()}/100',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: () {
                            if (widget.reportDocument.transitScore < 25) {
                              return FlutterFlowTheme.of(context).error;
                            } else if (widget.reportDocument.transitScore <
                                50) {
                              return FlutterFlowTheme.of(context).orange;
                            } else if (widget.reportDocument.transitScore <
                                75) {
                              return FlutterFlowTheme.of(context).warning;
                            } else {
                              return FlutterFlowTheme.of(context).green;
                            }
                          }(),
                          fontSize: 16,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Text(
                  widget.reportDocument.transitReport,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        fontSize: 16,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            )
          ])),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
        child: ElevatedButton(
          onPressed: widget.propertiesButtonAction,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.white, // Button background color
            minimumSize: const Size.fromHeight(50), // Height of the button
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon,
                Text(
                  'View Properties Available',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).accent1,
                        fontSize: 18,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ].divide(SizedBox(width: 12)),
            ),
          ),
        ),
      ),
      Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          child: ElevatedButton(
            onPressed: createAndSetPDF,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Button background color
              minimumSize: const Size.fromHeight(50), // Height of the button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
            ),
            child: const SizedBox(
              width: double.infinity, // Full width
              height: 50, // Ensures the button maintains the height
              child: Center(
                child: Text(
                  'Download PDF',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16, // Font size
                    fontWeight: FontWeight.w500, // Font weight
                  ),
                ),
              ),
            ),
          ))
    ]);
  }
}
