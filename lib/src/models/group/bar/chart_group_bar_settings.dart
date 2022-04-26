part of 'chart_group_bar_layer.dart';

/// A collection of values for settings in group bars.
class ChartGroupBarSettings {
  /// The padding between items of group bars.
  ///
  /// Defaults to 2.0
  final double paddingBetweenItems;

  /// The radius of group bars.
  ///
  /// Defaults to BorderRadius.zero
  final BorderRadius radius;

  /// The thickness of group bars.
  ///
  /// Defaults to 4.0
  final double thickness;

  const ChartGroupBarSettings({
    this.paddingBetweenItems = 2.0,
    this.radius = BorderRadius.zero,
    this.thickness = 4.0,
  });
}
