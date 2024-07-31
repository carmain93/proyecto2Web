import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GHume extends StatefulWidget {
  final double hum;
  const GHume({super.key, required this.hum});

  @override
  State<GHume> createState() => _GHumeState();
}

class _GHumeState extends State<GHume> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        labelsPosition: ElementsPosition.outside,
        axisLineStyle: const AxisLineStyle(
          thicknessUnit: GaugeSizeUnit.factor,
          thickness: 0.1,
        ),
        majorTickStyle: const MajorTickStyle(
            length: 0.1, thickness: 2, lengthUnit: GaugeSizeUnit.factor),
        minorTickStyle: const MinorTickStyle(
            length: 0.05, thickness: 1.5, lengthUnit: GaugeSizeUnit.factor),
        minimum: 0,
        maximum: 100,
        interval: 5,
        useRangeColorForAxis: true,
        axisLabelStyle: const GaugeTextStyle(fontWeight: FontWeight.bold),
        ranges: <GaugeRange>[
          GaugeRange(
              startValue: 0,
              endValue: 5,
              sizeUnit: GaugeSizeUnit.factor,
              color: Colors.brown,
              endWidth: 0.03,
              startWidth: 0.03),
          GaugeRange(
              startValue: 5,
              endValue: 50,
              sizeUnit: GaugeSizeUnit.factor,
              color: Colors.yellow,
              endWidth: 0.03,
              startWidth: 0.03),
          GaugeRange(
              startValue: 50,
              endValue: 100,
              sizeUnit: GaugeSizeUnit.factor,
              color: Colors.purple,
              endWidth: 0.03,
              startWidth: 0.03),
        ],
        pointers: <GaugePointer>[
          NeedlePointer(
              value: widget.hum,
              needleColor: Colors.black,
              tailStyle: const TailStyle(
                  length: 0.18,
                  width: 8,
                  color: Colors.black,
                  lengthUnit: GaugeSizeUnit.factor),
              needleLength: 0.68,
              needleStartWidth: 1,
              needleEndWidth: 8,
              knobStyle: const KnobStyle(
                  knobRadius: 0.07,
                  color: Colors.white,
                  borderWidth: 0.05,
                  borderColor: Colors.black),
              lengthUnit: GaugeSizeUnit.factor)
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: Text(
                "${widget.hum.toStringAsFixed(1)} °C",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              positionFactor: 0.8,
              angle: 90)
        ],
      ),
    ]);
  }
}