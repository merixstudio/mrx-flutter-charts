part of 'chart_candle_layer.dart';

/// Provides settings of candle.
class ChartCandleSettings {
  /// The radius of candle.
  ///
  /// Defaults to 4.0
  final double radius;

  /// The thickness of candle.
  ///
  /// Defaults to 8.0
  final double thickness;

  const ChartCandleSettings({
    this.radius = 4.0,
    this.thickness = 8.0,
  });
}
