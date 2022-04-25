part of 'chart_painter.dart';

/// Layer painter for grid.
class _ChartGridPainter {
  const _ChartGridPainter._();

  /// Draw grid.
  static void draw({
    required Canvas canvas,
    required AnimationController controller,
    required ChartGridLayer layer,
    required ChartPainterData painterData,
    ChartGridLayer? oldLayer,
  }) {
    _drawX(
      canvas: canvas,
      controller: controller,
      data: layer.x,
      oldData: oldLayer?.x,
      painterData: painterData,
      settings: layer.settings.x,
    );
    _drawY(
      canvas: canvas,
      controller: controller,
      data: layer.y,
      oldData: oldLayer?.y,
      painterData: painterData,
      settings: layer.settings.y,
    );
  }

  static void _calculateX({
    required AnimationController controller,
    required ChartGridDataItem item,
    required ChartPainterData painterData,
    required ChartGridSettingsAxis settings,
    ChartGridDataItem? oldItem,
  }) {
    final double offsetX =
        painterData.size.width * item.value / (settings.max - settings.min);
    final Offset startPos = Offset(
      painterData.position.dx + offsetX,
      painterData.position.dy,
    );
    final Offset endPos = Offset(
      startPos.dx,
      painterData.position.dy + painterData.size.height,
    );
    item.setup(
      color: settings.color,
      controller: controller,
      endPos: endPos,
      initialColor: oldItem?.lastColor,
      initialEndPos: oldItem?.lastEndPos ?? endPos,
      initialStartPos: oldItem?.lastStartPos ?? startPos,
      oldItem: oldItem,
      startPos: startPos,
    );
  }

  static void _calculateY({
    required AnimationController controller,
    required ChartGridDataItem item,
    required ChartPainterData painterData,
    required ChartGridSettingsAxis settings,
    ChartGridDataItem? oldItem,
  }) {
    final double offsetY =
        painterData.size.height * item.value / (settings.max - settings.min);
    final Offset startPos = Offset(
      painterData.position.dx,
      painterData.position.dy + offsetY,
    );
    final Offset endPos = Offset(
      painterData.position.dx + painterData.size.width,
      startPos.dy,
    );
    item.setup(
      color: settings.color,
      controller: controller,
      endPos: endPos,
      initialColor: oldItem?.lastColor,
      initialEndPos: oldItem?.lastEndPos ?? endPos,
      initialStartPos: oldItem?.lastStartPos ?? startPos,
      oldItem: oldItem,
      startPos: startPos,
    );
  }

  static void _drawX({
    required Canvas canvas,
    required AnimationController controller,
    required ChartGridData data,
    required ChartPainterData painterData,
    required ChartGridSettingsAxis settings,
    ChartGridData? oldData,
  }) {
    final Paint paint = Paint()..strokeWidth = settings.thickness;
    for (int i = 0; i < data.items.length; i++) {
      final ChartGridDataItem item = data.items[i];
      _calculateX(
        controller: controller,
        item: item,
        oldItem: (oldData?.items)?.getOrNull(i),
        painterData: painterData,
        settings: settings,
      );
      canvas.drawLine(
        item.currentStartPos,
        item.currentEndPos,
        paint..color = item.currentColor,
      );
    }
  }

  static void _drawY({
    required Canvas canvas,
    required AnimationController controller,
    required ChartGridData data,
    required ChartPainterData painterData,
    required ChartGridSettingsAxis settings,
    ChartGridData? oldData,
  }) {
    final Paint paint = Paint()..strokeWidth = settings.thickness;
    for (int i = 0; i < data.items.length; i++) {
      final ChartGridDataItem item = data.items[i];
      _calculateY(
        controller: controller,
        item: item,
        oldItem: (oldData?.items)?.getOrNull(i),
        painterData: painterData,
        settings: settings,
      );
      canvas.drawLine(
        item.currentStartPos,
        item.currentEndPos,
        paint..color = item.currentColor,
      );
    }
  }
}
