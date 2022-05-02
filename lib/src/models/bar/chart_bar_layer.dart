import 'package:mrx_charts/src/models/animation/chart_animation.dart';
import 'package:mrx_charts/src/models/chart_data_item.dart';
import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'chart_bar_data_item.dart';
part 'chart_bar_settings.dart';

/// This layer allows to render bars.
class ChartBarLayer extends ChartLayer {
  /// The items data of bars.
  final List<ChartBarDataItem> items;

  /// The settings of bars.
  final ChartBarSettings settings;

  const ChartBarLayer({
    required this.items,
    required this.settings,
  });

  /// Disposing all animations.
  @override
  void dispose() {
    for (final ChartBarDataItem item in items) {
      item.dispose();
    }
  }
}
