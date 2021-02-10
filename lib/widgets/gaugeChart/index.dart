import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class GaugeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate = false;
  int arcWidth = 20;
  GaugeChart({this.seriesList, this.arcWidth});
  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: this.arcWidth,
          startAngle: 3 / 5 * pi,
          arcLength: 9 / 5 * pi,
        ));
  }

  static List<charts.Series<GaugeSegment, String>> createSampleData(
    double used, {
    Color usedColor,
    Color unuserColor,
  }) {
    double unuser = 100 - used;
    if (usedColor == null) {
      usedColor = Color(0xFF58b2f6);
    }
    if (unuserColor == null) {
      unuserColor = Colors.grey;
    }
    if (used >= 80) {
      usedColor = Colors.red;
    }

    final data = [
      new GaugeSegment('Used', used, usedColor),
      new GaugeSegment('Unused', unuser, unuserColor),
    ];
    return [
      new charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        colorFn: (GaugeSegment segment, _) => charts.Color(
          r: segment.color.red,
          g: segment.color.green,
          b: segment.color.blue,
          a: segment.color.alpha,
        ),
        data: data,
      )
    ];
  }
}

/// Sample data type.
class GaugeSegment {
  final String segment;
  final double size;
  final Color color;
  GaugeSegment(this.segment, this.size, this.color);
}
