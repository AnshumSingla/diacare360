import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

SfRadialGauge radialGauge(String title, double value) {
  return SfRadialGauge(
    title: GaugeTitle(text: title),
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 18,
        maximum: 27,
        startAngle: 180,
        endAngle: 360,
        ranges: <GaugeRange>[
          GaugeRange(startValue: 18, endValue: 22.99, color: Colors.green),
          GaugeRange(startValue: 22.99, endValue: 25, color: Colors.orange),
          GaugeRange(startValue: 25, endValue: 27, color: Colors.red),
        ],
        interval: 2,
        pointers: <GaugePointer>[
          NeedlePointer(
              value: value > 30
                  ? 30
                  : value < 15
                      ? 15
                      : value),
        ],
        canRotateLabels: true,
        radiusFactor: 1.01,
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
            widget: Text(
              value.toStringAsFixed(2) + 'kg/m2',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
            ),
          ),
        ],
      ),
    ],
  );
}
