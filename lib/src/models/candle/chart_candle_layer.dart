import 'package:mrx_charts/src/models/animation/chart_animation.dart';
import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'chart_candle_data_item.dart';
part 'chart_candle_data_item_value.dart';
part 'chart_candle_settings.dart';

/// Provides paint for candle layer.
class ChartCandleLayer extends ChartLayer {
  /// The items data of candle.
  final List<ChartCandleDataItem> items;

  /// The settings of candle.
  final ChartCandleSettings settings;

  const ChartCandleLayer({
    required this.items,
    required this.settings,
  });

  /// Dispose all animations.
  @override
  void dispose() {
    for (final ChartCandleDataItem item in items) {
      item.dispose();
    }
  }
}
