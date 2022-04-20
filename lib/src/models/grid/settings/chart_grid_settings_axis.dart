part of '../chart_grid_layer.dart';

class ChartGridSettingsAxis {
  final Color color;
  final double frequency;
  final double max;
  final double min;
  final double thickness;

  const ChartGridSettingsAxis({
    required this.color,
    required this.frequency,
    required this.max,
    required this.min,
    this.thickness = 1.0,
  });

  ChartGridData generate() => ChartGridData(
        items: List.generate(
          ((max - min) ~/ frequency) + 1,
          (index) => ChartGridDataItem(
            value: index * frequency,
          ),
        ),
      );
}
