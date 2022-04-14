part of '../chart_axis_layer.dart';

class ChartAxisSettingsAxis {
  final double frequency;
  final double max;
  final double min;
  final TextStyle textStyle;

  const ChartAxisSettingsAxis({
    required this.frequency,
    required this.max,
    required this.min,
    required this.textStyle,
  });

  ChartAxisData generate({
    required String Function(double) label,
  }) =>
      ChartAxisData(
        max: max,
        min: min,
        items: List.generate(
          ((max - min) ~/ frequency) + 1,
          (index) => ChartAxisDataItem(
            label: label(index * frequency + min),
            value: index * frequency + min,
          ),
        ),
      );
}
