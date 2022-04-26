part of 'chart_highlight_shape.dart';

/// Provides highlight line shape.
class ChartHighlightLineShape<T extends ChartDataItem>
    extends ChartHighlightShape {
  /// The background color of shape.
  final Color backgroundColor;

  /// The width of shape.
  final double width;

  /// The function return current position of shape.
  final Offset Function(T) currentPos;

  /// The radius of shape.
  ///
  /// Defaults to BorderRadius.zero
  final BorderRadius radius;

  const ChartHighlightLineShape({
    required this.backgroundColor,
    required this.currentPos,
    required this.width,
    this.radius = BorderRadius.zero,
  });

  /// Draw highlight line shape.
  @override
  void draw(Canvas canvas, ChartPainterData painterData,
      ChartTouchCallbackData touchedData, double tolerance) {
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
