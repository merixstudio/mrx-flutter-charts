import 'package:mrx_charts/models/chart_data_item.dart';
import 'package:mrx_charts/models/chart_painter_data.dart';
import 'package:mrx_charts/touch/stock_touch_callback_data.dart';
import 'package:flutter/material.dart';

part 'chart_highlight_line_shape.dart';

abstract class ChartHighlightShape {
  const ChartHighlightShape();

  void draw(Canvas canvas, ChartPainterData painterData, ChartTouchCallbackData touchedData, double tolerance);
}
