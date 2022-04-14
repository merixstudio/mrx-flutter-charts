import 'package:chart/models/animation/chart_animation.dart';
import 'package:chart/models/chart_data_item.dart';
import 'package:chart/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'chart_group_bar_data_item.dart';
part 'chart_group_bar_settings.dart';

class ChartGroupBarLayer extends ChartLayer {
  final List<List<ChartGroupBarDataItem>> items;
  final ChartGroupBarSettings settings;

  const ChartGroupBarLayer({
    required this.items,
    required this.settings,
  });

  @override
  void dispose() {
    for (final List<ChartGroupBarDataItem> item in items) {
      for (final ChartGroupBarDataItem item in item) {
        item.dispose();
      }
    }
  }
}
