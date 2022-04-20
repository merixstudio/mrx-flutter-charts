part of '../chart_grid_layer.dart';

class ChartGridData {
  final List<ChartGridDataItem> items;
  final double max;
  final double min;

  ChartGridData({
    required this.items,
  })  : min = items.isNotEmpty
            ? ([...items]..sort((a, b) => a.value.compareTo(b.value)))
                .first
                .value
            : 0.0,
        max = items.isNotEmpty
            ? ([...items]..sort((a, b) => a.value.compareTo(b.value)))
                .last
                .value
            : 0.0;

  void dispose() {
    for (final ChartGridDataItem item in items) {
      item.dispose();
    }
  }
}
