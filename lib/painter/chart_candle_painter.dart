part of 'chart_painter.dart';

class _ChartCandlePainter {
  const _ChartCandlePainter._();

  static void draw({
    required Canvas canvas,
    required AnimationController controller,
    required ChartCandleLayer layer,
    required ChartPainterData painterData,
    required ChartAxisValue xValue,
    required ChartAxisValue yValue,
    ChartCandleLayer? oldLayer,
  }) {
    for (int i = 0; i < layer.items.length; i++) {
      final ChartCandleDataItem item = layer.items[i];
      _calculate(
        controller: controller,
        item: item,
        oldItem: (oldLayer?.items)?.getOrNull(i),
        painterData: painterData,
        settings: layer.settings,
        xValue: xValue,
        yValue: yValue,
      );
      canvas
        ..drawRRect(
          RRect.fromRectAndRadius(
            item.value1.currentPos & item.value1.currentSize,
            Radius.circular(layer.settings.radius),
          ),
          Paint()..color = item.value1.currentColor,
        )
        ..drawRRect(
          RRect.fromRectAndRadius(
            item.value2.currentPos & item.value2.currentSize,
            Radius.circular(layer.settings.radius),
          ),
          Paint()..color = item.value2.currentColor,
        );
    }
  }

  static void _calculate({
    required AnimationController controller,
    required ChartCandleDataItem item,
    required ChartPainterData painterData,
    required ChartCandleSettings settings,
    required ChartAxisValue xValue,
    required ChartAxisValue yValue,
    ChartCandleDataItem? oldItem,
  }) {
    final double offsetX = painterData.size.width * (item.x - xValue.min) / (xValue.max - xValue.min);
    final Size size1 = Size(
      settings.thickness,
      painterData.size.height * (item.value1.max - item.value1.min) / (yValue.max - yValue.min),
    );
    final Offset pos1 = Offset(
      painterData.position.dx - size1.width.half + offsetX,
      painterData.position.dy + painterData.size.height * (yValue.max - item.value1.max) / (yValue.max - yValue.min),
    );
    item.value1.setup(
      color: item.color,
      controller: controller,
      initialColor: (oldItem?.value1)?.lastColor,
      initialPos: (oldItem?.value1)?.lastPos ??
          Offset(
            pos1.dx,
            painterData.position.dy + painterData.size.height,
          ),
      initialSize: (oldItem?.value1)?.lastSize ?? Size(size1.width, 0.0),
      oldItem: oldItem?.value1,
      pos: pos1,
      size: size1,
    );
    final Size size2 = Size(
      1.0,
      painterData.size.height * (item.value2.max - item.value2.min) / (yValue.max - yValue.min),
    );
    final Offset pos2 = Offset(
      painterData.position.dx - size2.width.half + offsetX,
      painterData.position.dy + painterData.size.height * (yValue.max - item.value2.max) / (yValue.max - yValue.min),
    );
    item.value2.setup(
      color: item.color,
      controller: controller,
      initialColor: (oldItem?.value1)?.lastColor,
      initialPos: (oldItem?.value2)?.lastPos ??
          Offset(
            pos1.dx,
            painterData.position.dy + painterData.size.height,
          ),
      initialSize: (oldItem?.value2)?.lastSize ?? Size(size2.width, 0.0),
      oldItem: oldItem?.value2,
      pos: pos2,
      size: size2,
    );
  }
}
