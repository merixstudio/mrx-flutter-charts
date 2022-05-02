part of '../chart_grid_layer.dart';

/// A collection of values for settings in axises.
class ChartGridSettings {
  /// The x axis of grid.
  final ChartGridSettingsAxis x;

  /// The y axis of grid.
  final ChartGridSettingsAxis y;

  const ChartGridSettings({
    required this.x,
    required this.y,
  });
}
