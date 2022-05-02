part of '../chart_axis_layer.dart';

/// Providing datas of the selected axis.
class ChartAxisData {
  /// The items data of axis.
  final List<ChartAxisDataItem> items;

  /// The max value in the data.
  final double max;

  /// The min value in the data.
  final double min;

  ChartAxisData({
    required this.items,
    required this.max,
    required this.min,
  });

  /// Disposing all animations.
  void dispose() {
    for (final ChartAxisDataItem item in items) {
      item.dispose();
    }
  }
}
