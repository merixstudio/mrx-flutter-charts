part of 'chart_painter.dart';

class _ChartHighlightPainter {
  const _ChartHighlightPainter._();

  static void draw({
    required Canvas canvas,
    required ChartHighlightLayer layer,
    required ChartPainterData painterData,
    required double tolerance,
    required ChartTouchCallbackData touchedData,
  }) {
    final ChartHighlightShape shape = layer.shape();
    shape.draw(canvas, painterData, touchedData, tolerance);
  }
}
