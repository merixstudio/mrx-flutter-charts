part of '../chart_grid_layer.dart';

/// A collection of values for settings of the selected axis.
class ChartGridSettingsAxis {
  /// The color of grid in the axis.
  final Color color;

  /// The frequency line of grid in the axis.
  final double frequency;

  /// The max of the value grid in the axis.
  final double max;

  /// The min of the value grid in the axis.
  final double min;

  /// The thickness line of grid in the axis.
  ///
  /// Defaults to 1.0
  final double thickness;

  const ChartGridSettingsAxis({
    required this.color,
    required this.frequency,
    required this.max,
    required this.min,
    this.thickness = 1.0,
  });

  /// Generate all items of grid in the axis.
  ChartGridData generate() => ChartGridData(
        items: List.generate(
          ((max - min) ~/ frequency) + 1,
          (index) => ChartGridDataItem(
            value: index * frequency,
          ),
        ),
      );
}
