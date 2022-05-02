part of 'chart_group_pie_layer.dart';

/// A collection of values for settings in group pies.
class ChartGroupPieSettings {
  /// The angle offset of group pies.
  ///
  /// Defaults to 30.0
  final double angleOffset;

  /// The gap between chart circles of group pies.
  ///
  /// Defaults to 20.0
  final double gapBetweenChartCircles;

  /// The gap sweep angle of group pies.
  ///
  /// Defaults to 10.0
  final double gapSweepAngle;

  /// The radius of group pies.
  ///
  /// Defaults to 4.0
  final double radius;

  /// The thickness of group pies.
  ///
  /// Defaults to 8.0
  final double thickness;

  const ChartGroupPieSettings({
    this.angleOffset = 30.0,
    this.gapBetweenChartCircles = 20.0,
    this.gapSweepAngle = 10.0,
    this.radius = 4.0,
    this.thickness = 8.0,
  });
}
