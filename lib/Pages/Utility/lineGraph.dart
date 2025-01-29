import 'package:diacare360/Pages/Utility/points.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineGraph extends StatefulWidget {
  final List<PointXY> points;
  const LineGraph(this.points, {super.key});

  @override
  State<LineGraph> createState() => _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: widget.points.map((point) {
                // Map the time values (12, 3, 6, 9) to corresponding X positions
                double x = point.time == '12 am'
                    ? 0
                    : point.time == '3 am'
                        ? 1
                        : point.time == '6 am'
                            ? 2
                            : point.time == '9 am'
                                ? 3
                                : point.time == '12 pm'
                                    ? 4
                                    : point.time == '3 pm'
                                        ? 5
                                        : point.time == '6 pm'
                                            ? 6
                                            : point.time == '9 pm'
                                                ? 7
                                                : 0; // Default to 0 for other times
                return FlSpot(x, point.bg);
              }).toList(),
              isCurved: false,
              dotData: FlDotData(show: true),
              shadow: Shadow(blurRadius: 1),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              axisNameWidget: Text('Blood Glucose (mg/dl)'),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(value.toString(), style: TextStyle(fontSize: 12));
                },
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: Text('Time'),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  if (value == 0) {
                    return Text('12 am', style: TextStyle(fontSize: 12));
                  } else if (value == 1) {
                    return Text('3 am', style: TextStyle(fontSize: 12));
                  } else if (value == 2) {
                    return Text('6 am', style: TextStyle(fontSize: 12));
                  } else if (value == 3) {
                    return Text('9 am', style: TextStyle(fontSize: 12));
                  } else if (value == 4) {
                    return Text('12 pm', style: TextStyle(fontSize: 12));
                  } else if (value == 5) {
                    return Text('3 pm', style: TextStyle(fontSize: 12));
                  } else if (value == 6) {
                    return Text('6 pm', style: TextStyle(fontSize: 12));
                  } else if (value == 7) {
                    return Text('9 pm', style: TextStyle(fontSize: 12));
                  } else {
                    return SizedBox(); // Hide other values
                  }
                },
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
