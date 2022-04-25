part of 'chart_painter.dart';

/// Layer painter for line.
class _ChartLinePainter {
  const _ChartLinePainter._();

  /// Draw line.
  static void draw({
    required Canvas canvas,
    required AnimationController controller,
    required ChartLineLayer layer,
    required ChartPainterData painterData,
    required List<TouchableShape<ChartDataItem>> touchableShapes,
    required ChartAxisValue xValue,
    required ChartAxisValue yValue,
    ChartLineLayer? oldLayer,
  }) {
    for (int i = 0; i < layer.items.length; i++) {
      final ChartLineDataItem item = layer.items[i];
      _calculate(
        controller: controller,
        item: item,
        oldItem: (oldLayer?.items)?.getOrNull(i),
        oldLayer: oldLayer,
        painterData: painterData,
        settings: layer.settings,
        xValue: xValue,
        yValue: yValue,
      );
    }
    _draw(
      canvas: canvas,
      layer: layer,
    );
    final double v1 = (layer.items.getOrNull(1)?.currentValuePos)?.dx ?? 0.0;
    final double v2 = (layer.items.firstOrNull?.currentValuePos)?.dx ?? 0.0;
    final double weight = (max(v1, v2) - min(v1, v2)) * 0.9;
    for (int i = 0; i < layer.items.length; i++) {
      final ChartLineDataItem item = layer.items[i];
      _calculateTouch(
        controller: controller,
        item: item,
        oldItem: (oldLayer?.items)?.getOrNull(i),
        painterData: painterData,
        weight: weight,
      );
      touchableShapes.add(
        RectangleShape<ChartLineDataItem>(
          data: item,
          rectOffset: item.currentTouchPos,
          rectSize: item.currentTouchSize,
        ),
      );
    }
  }

  static void _calculate({
    required AnimationController controller,
    required ChartLineDataItem item,
    required ChartPainterData painterData,
    required ChartLineSettings settings,
    required ChartAxisValue xValue,
    required ChartAxisValue yValue,
    ChartLineLayer? oldLayer,
    ChartLineDataItem? oldItem,
  }) {
    final double offsetX = painterData.size.width *
        (item.x - xValue.min) /
        (xValue.max - xValue.min);
    final Offset pos = Offset(
      painterData.position.dx + offsetX,
      painterData.position.dy +
          painterData.size.height -
          (painterData.size.height *
              (item.value - yValue.min) /
              (yValue.max - yValue.min)),
    );
    final ChartLineDataItem? oldItemLast = (oldLayer?.items)?.lastOrNull;
    item.setupValue(
      controller: controller,
      color: settings.color,
      initialColor: oldItem?.lastValueColor ?? Colors.transparent,
      initialPos: oldItem?.lastValuePos ??
          (oldItemLast != null
              ? Offset(painterData.position.dx + painterData.size.width,
                  oldItemLast.lastValuePos.dy)
              : Offset(
                  pos.dx, painterData.position.dy + painterData.size.height)),
      pos: pos,
      oldItem: oldItem,
    );
  }

  static void _calculateTouch({
    required AnimationController controller,
    required ChartLineDataItem item,
    required ChartPainterData painterData,
    required double weight,
    ChartLineDataItem? oldItem,
  }) {
    final Size size = Size(
      weight,
      painterData.size.height,
    );
    final Offset pos = Offset(
      item.currentValuePos.dx - weight.half,
      painterData.position.dy,
    );
    item.setupTouch(
      controller: controller,
      initialPos: oldItem?.lastTouchPos ?? pos,
      initialSize: oldItem?.lastTouchSize ?? size,
      oldItem: oldItem,
      pos: pos,
      size: size,
    );
  }

  static void _draw({
    required Canvas canvas,
    required ChartLineLayer layer,
  }) {
    final Path curvePath = Path();
    final Paint paint = Paint()
      ..strokeWidth = layer.settings.thickness
      ..style = PaintingStyle.stroke
      ..color = layer.settings.color;
    late Offset previousPos;
    for (int i = 0; i < layer.items.length; i++) {
      final ChartLineDataItem lineItem = layer.items[i];
      final Offset currentPos = lineItem.currentValuePos;
      if (i < 1) {
        curvePath.moveTo(currentPos.dx, currentPos.dy);
      } else {
        final Offset controlPos = Offset(
          previousPos.dx + (currentPos.dx - previousPos.dx).half,
          previousPos.dy,
        );
        final Offset controlPos2 = Offset(
          currentPos.dx + (previousPos.dx - currentPos.dx).half,
          currentPos.dy,
        );
        curvePath.cubicTo(
          controlPos.dx,
          controlPos.dy,
          controlPos2.dx,
          controlPos2.dy,
          currentPos.dx,
          currentPos.dy,
        );
      }
      previousPos = currentPos;
    }
    canvas.drawPath(
      curvePath,
      paint
        ..color =
            layer.items.firstOrNull?.currentValueColor ?? Colors.transparent,
    );
  }
}
