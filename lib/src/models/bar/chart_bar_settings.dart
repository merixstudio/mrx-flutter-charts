part of 'chart_bar_layer.dart';

/// Provides settings of bar.
class ChartBarSettings {
  /// The radius of bar.
  ///
  /// Default to 4.0
  final BorderRadius radius;

  /// The thickness of bar.
  ///
  /// Default to BorderRadius.zero
  final double thickness;

  const ChartBarSettings({
    this.thickness = 4.0,
    this.radius = BorderRadius.zero,
  });
}
