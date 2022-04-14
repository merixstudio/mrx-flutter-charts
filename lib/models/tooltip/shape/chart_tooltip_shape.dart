import 'dart:math';

import 'package:chart/models/chart_data_item.dart';
import 'package:chart/models/chart_painter_data.dart';
import 'package:chart/touch/stock_touch_callback_data.dart';
import 'package:flutter/material.dart';

part 'chart_tooltip_bar_shape.dart';
part 'chart_tooltip_line_shape.dart';
part 'chart_tooltip_pie_shape.dart';

abstract class ChartTooltipShape {
  const ChartTooltipShape();

  void draw(Canvas canvas, ChartPainterData painterData, ChartTouchCallbackData touchedData, double tolerance);
}
