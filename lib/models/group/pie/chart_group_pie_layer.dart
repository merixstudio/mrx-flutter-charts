import 'package:chart/models/animation/chart_animation.dart';
import 'package:chart/models/chart_data_item.dart';
import 'package:chart/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'chart_group_pie_data_item.dart';
part 'chart_group_pie_settings.dart';

class ChartGroupPieLayer extends ChartLayer {
  final List<List<ChartGroupPieDataItem>> items;
  final ChartGroupPieSettings settings;

  const ChartGroupPieLayer({
    required this.items,
    required this.settings,
  });

  @override
  void dispose() {
    for (final List<ChartGroupPieDataItem> item in items) {
      for (final ChartGroupPieDataItem item in item) {
        item.dispose();
      }
    }
  }
}
