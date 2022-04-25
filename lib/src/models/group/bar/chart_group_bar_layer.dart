import 'package:mrx_charts/src/models/animation/chart_animation.dart';
import 'package:mrx_charts/src/models/chart_data_item.dart';
import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'chart_group_bar_data_item.dart';
part 'chart_group_bar_settings.dart';

/// Provides paint for group bar layer.
class ChartGroupBarLayer extends ChartLayer {
  /// The items data of group bar.
  final List<List<ChartGroupBarDataItem>> items;

  /// The settings of group bar.
  final ChartGroupBarSettings settings;

  const ChartGroupBarLayer({
    required this.items,
    required this.settings,
  });

  /// Dispose all animations.
  @override
  void dispose() {
    for (final List<ChartGroupBarDataItem> item in items) {
      for (final ChartGroupBarDataItem item in item) {
        item.dispose();
      }
    }
  }
}
