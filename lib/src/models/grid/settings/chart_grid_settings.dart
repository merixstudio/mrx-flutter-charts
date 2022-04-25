part of '../chart_grid_layer.dart';

/// Provides settings of grid.
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
