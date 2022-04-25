import 'package:mrx_charts/src/models/animation/chart_animation.dart';
import 'package:mrx_charts/src/models/chart_data_item.dart';
import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'chart_bar_data_item.dart';
part 'chart_bar_settings.dart';

/// Provides paint for bar layer.
class ChartBarLayer extends ChartLayer {
  /// The items data of bar.
  final List<ChartBarDataItem> items;

  /// The settings of bar.
  final ChartBarSettings settings;

  const ChartBarLayer({
    required this.items,
    required this.settings,
  });

  /// Dispose all animations.
  @override
  void dispose() {
    for (final ChartBarDataItem item in items) {
      item.dispose();
    }
  }
}
