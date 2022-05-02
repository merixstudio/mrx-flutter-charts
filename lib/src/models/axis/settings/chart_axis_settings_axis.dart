part of '../chart_axis_layer.dart';

/// A collection of values for settings of the selected axis.
class ChartAxisSettingsAxis {
  /// The frequency of the value.
  final double frequency;

  /// The max of the value in the axis.
  final double max;

  /// The min of the value in the axis.
  final double min;

  /// The TextStyle in axis.
  final TextStyle textStyle;

  const ChartAxisSettingsAxis({
    required this.frequency,
    required this.max,
    required this.min,
    required this.textStyle,
  });

  /// Generate all items of axis.
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
