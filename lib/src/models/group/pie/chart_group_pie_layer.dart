import 'package:mrx_charts/src/models/animation/chart_animation.dart';
import 'package:mrx_charts/src/models/chart_data_item.dart';
import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'chart_group_pie_data_item.dart';
part 'chart_group_pie_settings.dart';

/// This layer allows to render group pies.
class ChartGroupPieLayer extends ChartLayer {
  /// The items data of group pies.
  final List<List<ChartGroupPieDataItem>> items;

  /// The settings of group pies.
  final ChartGroupPieSettings settings;

  const ChartGroupPieLayer({
    required this.items,
    required this.settings,
  });

  /// Disposing all animations.
  @override
  void dispose() {
    for (final List<ChartGroupPieDataItem> item in items) {
      for (final ChartGroupPieDataItem item in item) {
        item.dispose();
      }
    }
  }
}
