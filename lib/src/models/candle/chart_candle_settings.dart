part of 'chart_candle_layer.dart';

/// A collection of values for settings in candles.
class ChartCandleSettings {
  /// The radius of candles.
  ///
  /// Defaults to 4.0
  final double radius;

  /// The thickness of candles.
  ///
  /// Defaults to 8.0
  final double thickness;

  const ChartCandleSettings({
    this.radius = 4.0,
    this.thickness = 8.0,
  });
}
