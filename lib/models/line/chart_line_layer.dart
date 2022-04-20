import 'package:mrx_charts/models/animation/chart_animation.dart';
import 'package:mrx_charts/models/chart_data_item.dart';
import 'package:mrx_charts/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'chart_line_data_item.dart';
part 'chart_line_settings.dart';

class ChartLineLayer extends ChartLayer {
  final List<ChartLineDataItem> items;
  final ChartLineSettings settings;

  const ChartLineLayer({
    required this.items,
    required this.settings,
  });

  @override
  void dispose() {
    for (final ChartLineDataItem item in items) {
      item.dispose();
    }
  }
}
