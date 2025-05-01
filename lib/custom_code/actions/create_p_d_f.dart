// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/rendering.dart';

Future<Uint8List?> createImageFromWidget(BuildContext context, Widget widget,
    {Duration? wait, Size? logicalSize, Size? imageSize}) async {
  final repaintBoundary = RenderRepaintBoundary();

  logicalSize ??=
      View.of(context).physicalSize / View.of(context).devicePixelRatio;
  imageSize ??= View.of(context).physicalSize;

  assert(logicalSize.aspectRatio == imageSize.aspectRatio,
      'logicalSize and imageSize must not be the same');

  final renderView = RenderView(
      child: RenderPositionedBox(
          alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(
        physicalConstraints: BoxConstraints.tight(logicalSize) *
            View.of(context).devicePixelRatio,
        logicalConstraints: BoxConstraints.tight(logicalSize),
        devicePixelRatio: 1,
      ),
      view: View.of(context) //PlatformDispatcher.instance.views.first,
      );

  final pipelineOwner = PipelineOwner();
  final buildOwner = BuildOwner(focusManager: FocusManager());

  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();

  final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: widget,
      )).attachToRenderTree(buildOwner);

  buildOwner.buildScope(rootElement);

  if (wait != null) {
    await Future.delayed(wait);
  }

  buildOwner
    ..buildScope(rootElement)
    ..finalizeTree();

  pipelineOwner
    ..flushLayout()
    ..flushCompositingBits()
    ..flushPaint();

  final image = await repaintBoundary.toImage(
      pixelRatio: imageSize.width / logicalSize.width);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return byteData?.buffer.asUint8List();
}

Future<FFUploadedFile?> createPDF(BuildContext context) async {
  // Add your function code here!
  // Define the widget you want to capture

  //final Directory tempDir = await getTemporaryDirectory();
  //final String tempPath = tempDir.path;

  final widget = Container(
    width: 300,
    height: 150,
    color: Colors.blue,
    child: Center(
      child: Text(
        'Hello, Image!',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
  );
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List imageBytes = await screenshotController.captureFromWidget(widget);

  final pdf = pw.Document();
  // Add the image to the PDF
  final image = pw.MemoryImage(imageBytes);
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Image(image),
      ),
    ),
  );

  //final String pdfPath = '$tempPath/example.pdf';
  //final File file = File(pdfPath);
  //await file.writeAsBytes(await pdf.save());
  //OpenFile.open(pdfPath);

  final Uint8List pdfBytes = await pdf.save();
  final uploadedFile = FFUploadedFile(bytes: pdfBytes, name: 'example.pdf');
  return uploadedFile;
}
