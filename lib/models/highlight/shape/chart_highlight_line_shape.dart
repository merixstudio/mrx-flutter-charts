part of 'chart_highlight_shape.dart';

class ChartHighlightLineShape<T extends ChartDataItem> extends ChartHighlightShape {
  final Color backgroundColor;
  final double width;
  final Offset Function(T) currentPos;
  final BorderRadius radius;

  const ChartHighlightLineShape({
    required this.backgroundColor,
    required this.currentPos,
    required this.width,
    this.radius = BorderRadius.zero,
  });

  @override
  void draw(Canvas canvas, ChartPainterData painterData, ChartTouchCallbackData touchedData, double tolerance) {
    final T item = touchedData.selectedItem as T;
    final Offset currentValuePos = currentPos(item);
    final Offset pos = Offset(
      currentValuePos.dx - width / 2.0,
      painterData.position.dy,
    );
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        pos & Size(width, painterData.size.height),
        bottomLeft: radius.bottomLeft,
        bottomRight: radius.bottomRight,
        topLeft: radius.topLeft,
        topRight: radius.topRight,
      ),
      Paint()..color = backgroundColor,
    );
  }
}
