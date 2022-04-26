part of 'chart_group_bar_layer.dart';

/// Provides settings of group bar.
class ChartGroupBarSettings {
  /// The padding between items of group bar.
  ///
  /// Defaults to 2.0
  final double paddingBetweenItems;

  /// The radius of group bar.
  ///
  /// Defaults to BorderRadius.zero
  final BorderRadius radius;

  /// The thickness of bar.
  ///
  /// Defaults to 4.0
  final double thickness;

  const ChartGroupBarSettings({
    this.paddingBetweenItems = 2.0,
    this.radius = BorderRadius.zero,
    this.thickness = 4.0,
  });
}
