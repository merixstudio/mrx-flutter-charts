part of 'chart_painter.dart';

class _ChartBarPainter {
  const _ChartBarPainter._();

  static void draw({
    required Canvas canvas,
    required AnimationController controller,
    required ChartBarLayer layer,
    required ChartPainterData painterData,
    required List<TouchableShape<ChartDataItem>> touchableShapes,
    required ChartAxisValue xValue,
    required ChartAxisValue yValue,
    ChartBarLayer? oldLayer,
  }) {
    for (int i = 0; i < layer.items.length; i++) {
      final ChartBarDataItem item = layer.items[i];
      _calculate(
        controller: controller,
        item: item,
        oldItem: (oldLayer?.items)?.getOrNull(i),
        painterData: painterData,
        settings: layer.settings,
        xValue: xValue,
        yValue: yValue,
      );
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          item.currentValuePos & item.currentValueSize,
          bottomLeft: layer.settings.radius.bottomLeft,
          bottomRight: layer.settings.radius.bottomRight,
          topLeft: layer.settings.radius.topLeft,
          topRight: layer.settings.radius.topRight,
        ),
        Paint()..color = item.currentValueColor,
      );
      touchableShapes.add(
        RectangleShape<ChartBarDataItem>(
          data: item,
          rectOffset: item.currentTouchPos,
          rectSize: item.currentTouchSize,
        ),
      );
    }
  }

  static void _calculate({
    required AnimationController controller,
    required ChartBarDataItem item,
    required ChartPainterData painterData,
    required ChartBarSettings settings,
    required ChartAxisValue xValue,
    required ChartAxisValue yValue,
    ChartBarDataItem? oldItem,
  }) {
    final double offsetX = painterData.size.width *
        (item.x - xValue.min) /
        (xValue.max - xValue.min);
    final Size size = Size(
      settings.thickness,
      painterData.size.height *
          (item.value - yValue.min) /
          (yValue.max - yValue.min),
    );
    final Offset pos = Offset(
      painterData.position.dx + offsetX - size.width.half,
      painterData.position.dy + painterData.size.height - size.height,
    );
    item.setupValue(
      color: item.color,
      controller: controller,
      initialColor: oldItem?.lastValueColor ?? Colors.transparent,
      initialPos: oldItem?.lastValuePos ??
          Offset(pos.dx, painterData.position.dy + painterData.size.height),
      initialSize: oldItem?.lastValueSize ?? Size(size.width, 0.0),
      pos: pos,
      size: size,
    );
    item.setupTouch(
      controller: controller,
      initialPos:
          oldItem?.lastValuePos ?? Offset(pos.dx, painterData.position.dy),
      initialSize:
          oldItem?.lastValueSize ?? Size(size.width, painterData.size.height),
      pos: Offset(pos.dx, painterData.position.dy),
      size: Size(size.width, painterData.size.height),
    );
  }
}
