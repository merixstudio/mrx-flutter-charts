part of '../chart_grid_layer.dart';

/// Providing datas of the selected axis.
class ChartGridData {
  /// The items data of grid.
  final List<ChartGridDataItem> items;

  /// The max value in the data.
  final double max;

  /// The min value in the data.
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

  /// Disposing all animations.
  void dispose() {
    for (final ChartGridDataItem item in items) {
      item.dispose();
    }
  }
}
