import 'package:mrx_charts/src/models/chart_data_item.dart';
import 'package:flutter/material.dart';

class ChartTouchCallbackData {
  final Offset? clickedPos;
  final ChartDataItem selectedItem;

  const ChartTouchCallbackData({
    required this.selectedItem,
    this.clickedPos,
  });
}
