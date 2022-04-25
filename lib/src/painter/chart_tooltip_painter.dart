part of 'chart_painter.dart';

/// Layer painter for tooltip.
class _ChartTooltipPainter {
  const _ChartTooltipPainter._();

  /// Draw tooltip shape.
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
