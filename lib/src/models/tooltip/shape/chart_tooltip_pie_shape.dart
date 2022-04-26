part of 'chart_tooltip_shape.dart';

/// Provides tooltip pie shape.
class ChartTooltipPieShape<T extends ChartDataItem> extends ChartTooltipShape {
  /// The background color of shape.
  final Color backgroundColor;

  /// The function return text name of shape.
  final String Function(T) onTextName;

  /// The function return text value of shape.
  final String Function(T) onTextValue;

  /// The TextStyle for name of shape.
  final TextStyle nameTextStyle;

  /// The TextSty;e for value of shape.
  final TextStyle valueTextStyle;

  /// The padding of shape.
  ///
  /// Defaults to EdgeInsets.zero
  final EdgeInsets padding;

  /// The radius of shape.
  ///
  /// Defaults to 0.0
  final double radius;

  const ChartTooltipPieShape({
    required this.backgroundColor,
    required this.nameTextStyle,
    required this.onTextName,
    required this.onTextValue,
    required this.valueTextStyle,
    this.padding = EdgeInsets.zero,
    this.radius = 0.0,
  });

  /// Draw tooltip pie shape.
  @override
  void draw(Canvas canvas, ChartPainterData painterData,
      ChartTouchCallbackData touchedData, double tolerance) {
    final T item = touchedData.selectedItem as T;
    final TextPainter namePainter = TextPainter(
      text: TextSpan(
        text: onTextName(item),
        style: nameTextStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final TextPainter valuePainter = TextPainter(
      text: TextSpan(
        text: onTextValue(item),
        style: valueTextStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final Offset position = Offset(
      (touchedData.clickedPos?.dx ?? 0.0) -
          max(namePainter.width, valuePainter.width) / 2.0 -
          padding.horizontal / 2.0,
      (touchedData.clickedPos?.dy ?? 0.0) -
          (namePainter.height + valuePainter.height) / 2.0 -
          padding.vertical / 2.0,
    );
    final Size size = Size(
      max(namePainter.width, valuePainter.width) + padding.horizontal,
      namePainter.height + valuePainter.height + padding.vertical,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        position & size,
        Radius.circular(radius),
      ),
      Paint()..color = backgroundColor,
    );
    namePainter.paint(
      canvas,
      Offset(
        position.dx + (size.width - namePainter.width) / 2.0,
        position.dy + padding.top,
      ),
    );
    valuePainter.paint(
      canvas,
      Offset(
        position.dx + (size.width - valuePainter.width) / 2.0,
        position.dy + namePainter.height + padding.top,
      ),
    );
  }
}
