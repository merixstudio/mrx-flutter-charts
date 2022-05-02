part of 'chart_tooltip_shape.dart';

/// Provides tooltip bar shape.
class ChartTooltipBarShape<T extends ChartDataItem> extends ChartTooltipShape {
  /// The background color of shape.
  final Color backgroundColor;

  /// The margin bottom of shape.
  ///
  /// Defaults to 0.0
  final double marginBottom;

  /// The function return current position of shape.
  final Offset Function(T) currentPos;

  /// The function return current size of shape.
  final Size Function(T) currentSize;

  /// The function return text value of shape.
  final String Function(T) onTextValue;

  /// The padding of shape.
  ///
  /// Defaults to EdgeInsets.zero
  final EdgeInsets padding;

  /// The radius of shape.
  final double radius;

  /// The TextStyle of shape.
  final TextStyle textStyle;

  /// The triangle side length of shape.
  ///
  /// Defaults to 10.0
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

  /// Draw tooltip bar shape.
  @override
  void draw(Canvas canvas, ChartPainterData painterData,
      ChartTouchCallbackData touchedData, double tolerance) {
    final T item = touchedData.selectedItem as T;
    final Offset currentValuePos = currentPos(item);
    final Size currentValueSize = currentSize(item);
    final Offset itemPos = Offset(
        currentValuePos.dx + currentValueSize.width / 2.0, currentValuePos.dy);
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: onTextValue(item),
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final Offset pos = Offset(
      itemPos.dx - textPainter.width / 2.0,
      itemPos.dy -
          textPainter.height -
          padding.vertical / 2.0 -
          marginBottom -
          triangleSideLength * 0.5,
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
          : painterData.position.dx + tolerance + painterData.size.width <
                  rectPos.dx + rectSize.width
              ? -(painterData.position.dx +
                  painterData.size.width +
                  tolerance -
                  rectPos.dx -
                  rectSize.width)
              : 0.0,
      rectPos.dy < 0 ? rectPos.dy : 0.0,
    );
    final Path rectanglePath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset(rectPos.dx - offsetRectAndText.dx,
                  rectPos.dy - offsetRectAndText.dy) &
              rectSize,
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
