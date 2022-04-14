part of 'chart_painter.dart';

class _ChartTooltipPainter {
  const _ChartTooltipPainter._();

  static void draw({
    required Canvas canvas,
    required ChartTooltipLayer layer,
    required ChartPainterData painterData,
    required double tolerance,
    required ChartTouchCallbackData touchedData,
  }) {
    final ChartTooltipShape shape = layer.shape();
    shape.draw(canvas, painterData, touchedData, tolerance);
  }
}
