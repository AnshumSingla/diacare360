import 'package:diacare360/Pages/Utility/points.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class lineGraph extends StatefulWidget {
  final List<pointxy> points;
  const lineGraph(this.points, {super.key});

  @override
  State<lineGraph> createState() => _lineGraphState();
}

class _lineGraphState extends State<lineGraph> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: dayPointData
                  .map((point) => FlSpot(point.bg, point.time.toDouble()))
                  .toList(),
              isCurved: false,
              dotData: FlDotData(show: true),
              shadow: Shadow(blurRadius: 1),
            ),
            LineChartBarData(
              spots: weekPointData
                  .map((point) => FlSpot(point.bg, point.time.toDouble()))
                  .toList(),
              isCurved: false,
              dotData: FlDotData(show: true),
              shadow: Shadow(blurRadius: 1),
              color: Colors.amber,
            ),
            LineChartBarData(
              spots: monthPointData
                  .map((point) => FlSpot(point.bg, point.time.toDouble()))
                  .toList(),
              isCurved: false,
              dotData: FlDotData(show: true),
              shadow: Shadow(blurRadius: 1),
              color: Colors.red,
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              axisNameWidget: Text('BLood Glucose(mg/dl)'),
              sideTitles: SideTitles(
                showTitles: true,
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: Text('Time'),
              sideTitles: SideTitles(
                showTitles: true,
              ),
            ),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
          ),
        ),
      ),
    );
  }
}
