part of '../chart_axis_layer.dart';

class ChartAxisData {
  final List<ChartAxisDataItem> items;
  final double max;
  final double min;

  ChartAxisData({
    required this.items,
    required this.max,
    required this.min,
  });

  void dispose() {
    for (final ChartAxisDataItem item in items) {
      item.dispose();
    }
  }
}
