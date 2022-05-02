import 'package:mrx_charts/src/models/chart_data_item.dart';
import 'package:mrx_charts/src/models/chart_painter_data.dart';
import 'package:mrx_charts/src/touch/chart_touch_callback_data.dart';
import 'package:flutter/material.dart';

part 'chart_highlight_line_shape.dart';

/// Abstract class for hightlight shape.
abstract class ChartHighlightShape {
  const ChartHighlightShape();

  /// Draw custom shape.
  void draw(Canvas canvas, ChartPainterData painterData,
      ChartTouchCallbackData touchedData, double tolerance);
}
