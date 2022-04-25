part of '../chart_axis_layer.dart';

/// Provides settings of axis.
class ChartAxisSettings {
  /// The x of axis.
  final ChartAxisSettingsAxis x;

  /// The y of axis.
  final ChartAxisSettingsAxis y;

  const ChartAxisSettings({
    required this.x,
    required this.y,
  });
}
