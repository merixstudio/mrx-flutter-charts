part of 'chart_tooltip_shape.dart';

class ChartTooltipBarShape<T extends ChartDataItem> extends ChartTooltipShape {
  final Color backgroundColor;
  final double marginBottom;
  final Offset Function(T) currentPos;
  final Size Function(T) currentSize;
  final String Function(T) onTextValue;
  final EdgeInsets padding;
  final double radius;
  final TextStyle textStyle;
  final double triangleSideLength;

  const ChartTooltipBarShape({
    required this.backgroundColor,
    required this.currentPos,
    required this.currentSize,
    required this.onTextValue,
    required this.textStyle,
    this.marginBottom = 0.0,
    this.padding = EdgeInsets.zero,
    this.radius = 0.0,
    this.triangleSideLength = 10.0,
  });

  @override
  void draw(Canvas canvas, ChartPainterData painterData, ChartTouchCallbackData touchedData, double tolerance) {
    final T item = touchedData.selectedItem as T;
    final Offset currentValuePos = currentPos(item);
    final Size currentValueSize = currentSize(item);
    final Offset itemPos = Offset(currentValuePos.dx + currentValueSize.width / 2.0, currentValuePos.dy);
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: onTextValue(item),
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final Offset pos = Offset(
      itemPos.dx - textPainter.width / 2.0,
      itemPos.dy - textPainter.height - padding.vertical / 2.0 - marginBottom - triangleSideLength * 0.5,
    );
    final Offset rectPos = Offset(
      pos.dx - padding.horizontal / 2.0,
      pos.dy - padding.vertical / 2.0,
    );
    final Size rectSize = Size(
      textPainter.width + padding.horizontal,
      textPainter.height + padding.vertical,
    );
    final Offset offsetRectAndText = Offset(
      painterData.position.dx - tolerance > rectPos.dx
          ? -(painterData.position.dx - tolerance - rectPos.dx)
          : painterData.position.dx + tolerance + painterData.size.width < rectPos.dx + rectSize.width
              ? -(painterData.position.dx + painterData.size.width + tolerance - rectPos.dx - rectSize.width)
              : 0.0,
      rectPos.dy < 0 ? rectPos.dy : 0.0,
    );
    final Path rectanglePath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset(rectPos.dx - offsetRectAndText.dx, rectPos.dy - offsetRectAndText.dy) & rectSize,
          Radius.circular(radius),
        ),
      );
    final Offset triangleCenterPos = Offset(
      rectPos.dx + rectSize.width / 2.0,
      rectPos.dy + rectSize.height - offsetRectAndText.dy,
    );
    final Path trianglePath = Path()
      ..moveTo(
        triangleCenterPos.dx - triangleSideLength / 2.0,
        triangleCenterPos.dy - 1.0,
      )
      ..lineTo(
        triangleCenterPos.dx + triangleSideLength / 2.0,
        triangleCenterPos.dy - 1.0,
      )
      ..lineTo(
        triangleCenterPos.dx,
        triangleCenterPos.dy + triangleSideLength * 0.5 - 1.0,
      )
      ..close();
    canvas
      ..drawPath(
        rectanglePath,
        Paint()..color = backgroundColor,
      )
      ..drawPath(
        trianglePath,
        Paint()..color = backgroundColor,
      );
    textPainter.paint(
      canvas,
      Offset(
        pos.dx - offsetRectAndText.dx,
        pos.dy - offsetRectAndText.dy,
      ),
    );
  }
}
