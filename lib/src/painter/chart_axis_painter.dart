part of 'chart_painter.dart';

/// Layer painter for axis.
class _ChartAxisPainter {
  const _ChartAxisPainter._();

  /// Draw axis.
  static void draw({
    required Canvas canvas,
    required AnimationController controller,
    required ChartAxisLayer layer,
    required ChartPainterData painterDataAxisX,
    required ChartPainterData painterDataAxisY,
    ChartAxisLayer? oldLayer,
  }) {
    _drawX(
      canvas: canvas,
      controller: controller,
      data: layer.x,
      oldData: oldLayer?.x,
      painterData: painterDataAxisX,
      settings: layer.settings.x,
    );
    _drawY(
      canvas: canvas,
      controller: controller,
      data: layer.y,
      oldData: oldLayer?.y,
      painterData: painterDataAxisY,
      settings: layer.settings.y,
    );
  }

  static void _calculateX({
    required AnimationController controller,
    required ChartAxisDataItem item,
    required ChartPainterData painterData,
    required ChartAxisSettingsAxis settings,
    ChartAxisDataItem? oldItem,
  }) {
    final double offsetX = painterData.size.width *
        (item.value - settings.min) /
        (settings.max - settings.min);
    final Offset pos = Offset(
      painterData.position.dx + offsetX,
      painterData.position.dy,
    );
    item.setup(
      controller: controller,
      initialPos: oldItem?.lastPos ?? pos,
      pos: pos,
      initialTextStyle: oldItem?.lastTextStyle ??
          settings.textStyle.copyWith(
            color: Colors.transparent,
          ),
      textStyle: settings.textStyle,
      oldItem: oldItem,
    );
  }

  static void _calculateY({
    required AnimationController controller,
    required ChartAxisDataItem item,
    required ChartPainterData painterData,
    required ChartAxisSettingsAxis settings,
    ChartAxisDataItem? oldItem,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: item.label,
        style: settings.textStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final double diff = settings.max - settings.min;
    final double offsetY = painterData.size.height -
        painterData.size.height * (item.value - settings.min) / diff;
    final Offset pos = Offset(
      painterData.position.dx + painterData.size.width,
      painterData.position.dy + offsetY - textPainter.height.half,
    );
    item.setup(
      controller: controller,
      initialPos: oldItem?.lastPos ?? pos,
      initialTextStyle: settings.textStyle.copyWith(
        color: Colors.transparent,
      ),
      oldItem: oldItem,
      pos: pos,
      textStyle: settings.textStyle,
    );
  }

  static void _drawX({
    required Canvas canvas,
    required AnimationController controller,
    required ChartAxisData data,
    required ChartPainterData painterData,
    required ChartAxisSettingsAxis settings,
    ChartAxisData? oldData,
  }) {
    for (int i = 0; i < data.items.length; i++) {
      final ChartAxisDataItem item = data.items[i];
      _calculateX(
        controller: controller,
        item: item,
        oldItem: (oldData?.items)?.getOrNull(i),
        painterData: painterData,
        settings: settings,
      );
      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: item.label,
          style: item.currentTextStyle,
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
        canvas,
        Offset(
          item.currentPos.dx - textPainter.width.half,
          item.currentPos.dy,
        ),
      );
    }
  }

  static void _drawY({
    required Canvas canvas,
    required AnimationController controller,
    required ChartAxisData data,
    required ChartPainterData painterData,
    required ChartAxisSettingsAxis settings,
    ChartAxisData? oldData,
  }) {
    for (int i = 0; i < data.items.length; i++) {
      final ChartAxisDataItem item = data.items[i];
      _calculateY(
        controller: controller,
        item: item,
        oldItem: (oldData?.items)?.getOrNull(i),
        painterData: painterData,
        settings: settings,
      );
      final textPainter = TextPainter(
        text: TextSpan(
          text: item.label,
          style: item.currentTextStyle,
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
        canvas,
        Offset(
          item.currentPos.dx - textPainter.width,
          item.currentPos.dy,
        ),
      );
    }
  }
}
