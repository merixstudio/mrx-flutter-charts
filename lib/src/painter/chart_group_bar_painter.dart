part of 'chart_painter.dart';

/// Layer painter for group bar.
class _ChartGroupBarPainter {
  const _ChartGroupBarPainter._();

  /// Draw group bar.
  static void draw({
    required Canvas canvas,
    required AnimationController controller,
    required ChartGroupBarLayer layer,
    required ChartPainterData painterData,
    required List<TouchableShape<ChartDataItem>> touchableShapes,
    required ChartAxisValue xValue,
    required ChartAxisValue yValue,
    ChartGroupBarLayer? oldLayer,
  }) {
    for (int i = 0; i < layer.items.length; i++) {
      for (int j = 0; j < layer.items[i].length; j++) {
        final ChartGroupBarDataItem item = layer.items[i][j];
        _calculate(
          controller: controller,
          currentIndex: j + 1,
          item: item,
          maxIndex: layer.items[i].length,
          oldItem: (oldLayer?.items)?.getOrNull(i)?.getOrNull(j),
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
      }
    }
    final double v1 =
        ((layer.items.getOrNull(1)?.firstOrNull)?.currentValuePos)?.dx ?? 0.0;
    final double v2 =
        ((layer.items.firstOrNull?.lastOrNull)?.currentValuePos)?.dx ?? 0.0;
    final double weight = (max(v1, v2) - min(v1, v2)).half * 0.7;
    for (int i = 0; i < layer.items.length; i++) {
      for (int j = 0; j < layer.items[i].length; j++) {
        final ChartGroupBarDataItem item = layer.items[i][j];
        _calculateTouch(
          controller: controller,
          innerCurrentIndex: j,
          innerMaxIndex: layer.items[i].length,
          item: item,
          mainCurrentIndex: i,
          mainMaxIndex: layer.items.length,
          painterData: painterData,
          settings: layer.settings,
          weight: weight,
          xValue: xValue,
          yValue: yValue,
        );
        touchableShapes.add(
          RectangleShape<ChartGroupBarDataItem>(
            data: item,
            rectOffset: item.currentTouchPos,
            rectSize: item.currentTouchSize,
          ),
        );
      }
    }
  }

  static void _calculate({
    required AnimationController controller,
    required int currentIndex,
    required ChartGroupBarDataItem item,
    required int maxIndex,
    required ChartPainterData painterData,
    required ChartGroupBarSettings settings,
    required ChartAxisValue xValue,
    required ChartAxisValue yValue,
    ChartGroupBarDataItem? oldItem,
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
    final double groupWidth = maxIndex * settings.thickness +
        (maxIndex - 1) * settings.paddingBetweenItems;
    final Offset pos = Offset(
      painterData.position.dx +
          offsetX -
          (maxIndex - currentIndex + 1) * settings.thickness -
          (maxIndex - currentIndex) * settings.paddingBetweenItems +
          groupWidth.half,
      painterData.position.dy + painterData.size.height - size.height,
    );
    item.setupValue(
      color: item.color,
      controller: controller,
      initialColor: oldItem?.lastValueColor ?? Colors.transparent,
      initialPos: oldItem?.lastValuePos ??
          Offset(pos.dx, painterData.position.dy + painterData.size.height),
      initialSize: oldItem?.lastValueSize ?? Size(size.width, 0.0),
      oldItem: oldItem,
      pos: pos,
      size: size,
    );
  }

  static void _calculateTouch({
    required AnimationController controller,
    required int innerCurrentIndex,
    required int innerMaxIndex,
    required ChartGroupBarDataItem item,
    required int mainCurrentIndex,
    required int mainMaxIndex,
    required ChartPainterData painterData,
    required ChartGroupBarSettings settings,
    required double weight,
    required ChartAxisValue xValue,
    required ChartAxisValue yValue,
    ChartGroupBarDataItem? oldItem,
  }) {
    final double extraWidth = ((mainCurrentIndex == 0 &&
                innerCurrentIndex == 0) ||
            (mainCurrentIndex == mainMaxIndex - 1 &&
                innerCurrentIndex == innerMaxIndex - 1)
        ? 0.0
        : ((innerCurrentIndex == 0 || innerCurrentIndex == innerMaxIndex - 1)
            ? weight
            : 0.0));
    final Size size = Size(
      settings.thickness + extraWidth,
      painterData.size.height,
    );
    final Offset pos = Offset(
      item.currentValuePos.dx +
          (innerCurrentIndex == 0 ? (-size.width + settings.thickness) : 0.0),
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
}
