part of '../chart_axis_layer.dart';

/// A collection of values for settings in axises.
class ChartAxisSettings {
  /// The x of the axis.
  final ChartAxisSettingsAxis x;

  /// The y of the axis.
  final ChartAxisSettingsAxis y;

  const ChartAxisSettings({
    required this.x,
    required this.y,
  });
}
