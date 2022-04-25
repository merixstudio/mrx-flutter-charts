import 'package:mrx_charts/src/models/chart_data_item.dart';
import 'package:flutter/material.dart';

/// Provides callback touched data.
class ChartTouchCallbackData {
  /// The last position has been clicked.
  final Offset? clickedPos;

  /// The last item has been clicked.
  final ChartDataItem selectedItem;

  const ChartTouchCallbackData({
    required this.selectedItem,
    this.clickedPos,
  });
}
