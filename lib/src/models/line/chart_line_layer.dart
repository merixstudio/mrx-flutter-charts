import 'package:mrx_charts/src/models/animation/chart_animation.dart';
import 'package:mrx_charts/src/models/chart_data_item.dart';
import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'chart_line_data_item.dart';
part 'chart_line_settings.dart';

/// Provides paint for line layer.
class ChartLineLayer extends ChartLayer {
  /// The items data of line.
  final List<ChartLineDataItem> items;

  /// The settings of line.
  final ChartLineSettings settings;

  const ChartLineLayer({
    required this.items,
    required this.settings,
  });

  /// Dispose all animations.
  @override
  void dispose() {
    for (final ChartLineDataItem item in items) {
      item.dispose();
    }
  }
}
