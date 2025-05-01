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

import 'package:fl_chart/fl_chart.dart';

class CustomPieChart extends StatefulWidget {
  const CustomPieChart({
    super.key,
    this.width,
    this.height,
    required this.data,
  });

  final double? width;
  final double? height;
  final List<int> data;

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  @override
  Widget build(BuildContext context) {
    final isEmptyData = widget.data.every((element) => element == 0);
    return Container(
      width: 215, // Adjust width
      height: 215, // Adjust height
      child: isEmptyData
          ? Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200], // Circle background color
                ),
                width: 215, // Adjust size of the circle
                height: 215,
                alignment: Alignment.center,
                child: Text(
                  "No data",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : PieChart(
              PieChartData(
                sections: _buildSections(),
                centerSpaceRadius: 45, // Adjust for the donut hole size
                borderData: FlBorderData(show: false), // Disable borders
                sectionsSpace: 0, // Space between sections
              ),
            ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    final colors = [
      FlutterFlowTheme.of(context).blue,
      FlutterFlowTheme.of(context).orange2,
      FlutterFlowTheme.of(context).purple,
      FlutterFlowTheme.of(context).green2,
      FlutterFlowTheme.of(context).error
    ];

    return List.generate(
      widget.data.length,
      (index) => PieChartSectionData(
        color: colors[index],
        value: widget.data[index].toDouble(),
        title: '${widget.data[index]}%',
        titleStyle: FlutterFlowTheme.of(context).headlineSmall.override(
              fontFamily: 'Manrope',
              color: FlutterFlowTheme.of(context).secondaryBackground,
              fontSize: 13,
              letterSpacing: 0.0,
            ),
        radius: 60,
      ),
    );
  }
}
