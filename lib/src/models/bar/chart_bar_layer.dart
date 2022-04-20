import 'package:mrx_charts/src/models/animation/chart_animation.dart';
import 'package:mrx_charts/src/models/chart_data_item.dart';
import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'chart_bar_data_item.dart';
part 'chart_bar_settings.dart';

class ChartBarLayer extends ChartLayer {
  final List<ChartBarDataItem> items;
  final ChartBarSettings settings;

  const ChartBarLayer({
    required this.items,
    required this.settings,
  });

  @override
  void dispose() {
    for (final ChartBarDataItem item in items) {
      item.dispose();
    }
  }
}
