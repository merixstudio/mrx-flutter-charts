part of 'chart_bar_layer.dart';

/// A collection of values for settings in bars.
class ChartBarSettings {
  /// The radius of bars.
  ///
  /// Defaults to 4.0
  final BorderRadius radius;

  /// The thickness of bars.
  ///
  /// Defaults to BorderRadius.zero
  final double thickness;

  const ChartBarSettings({
    this.thickness = 4.0,
    this.radius = BorderRadius.zero,
  });
}
