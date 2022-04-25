part of '../chart_axis_layer.dart';

/// Provides data of axis.
class ChartAxisData {
  /// The items data of axis.
  final List<ChartAxisDataItem> items;

  /// The max value in data.
  final double max;

  /// The min value in data.
  final double min;

  ChartAxisData({
    required this.items,
    required this.max,
    required this.min,
  });

  /// Dispose all animations.
  void dispose() {
    for (final ChartAxisDataItem item in items) {
      item.dispose();
    }
  }
}
