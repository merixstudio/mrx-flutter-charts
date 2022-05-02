import 'dart:math';

import 'package:mrx_charts/src/models/chart_data_item.dart';
import 'package:mrx_charts/src/models/chart_painter_data.dart';
import 'package:mrx_charts/src/touch/chart_touch_callback_data.dart';
import 'package:flutter/material.dart';

part 'chart_tooltip_bar_shape.dart';
part 'chart_tooltip_line_shape.dart';
part 'chart_tooltip_pie_shape.dart';

/// Base class for tooltip shape that allows draw custom shape.
abstract class ChartTooltipShape {
  const ChartTooltipShape();

  /// Draw custom shape.
  void draw(Canvas canvas, ChartPainterData painterData,
      ChartTouchCallbackData touchedData, double tolerance);
}
