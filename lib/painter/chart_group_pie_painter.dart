part of 'chart_painter.dart';

class _ChartGroupPiePainter {
  const _ChartGroupPiePainter._();

  static double _sliceCursor = 0.0;

  static void draw({
    required Canvas canvas,
    required AnimationController controller,
    required ChartGroupPieLayer layer,
    required ChartPainterData painterData,
    required List<TouchableShape<ChartDataItem>> touchableShapes,
    ChartGroupPieLayer? oldLayer,
  }) {
    _sliceCursor = 0.0;
    final double radius = painterData.size.height * .35;
    final double centerX = painterData.size.width.half;
    final double centerY = painterData.size.height.half;
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = layer.settings.thickness;
    for (int i = 0; i < layer.items.length; i++) {
      final List<ChartGroupPieDataItem> items = layer.items[i];
      final double gapSweepSize = items.length < 2 ? 0.0 : layer.settings.gapSweepAngle * items.length;
      final double sliceSweepTotal = 360.0 - gapSweepSize;
      final double total = items.map((e) => e.amount).sum;
      _sliceCursor = layer.settings.angleOffset + layer.settings.gapSweepAngle.half;
      final double itemRadius = radius + i * layer.settings.gapBetweenChartCircles;
      final Rect rect = Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: itemRadius,
      );
      for (int j = 0; j < items.length; j++) {
        final ChartGroupPieDataItem item = items[j];
        _calculate(
          controller: controller,
          gapSweepAngle: layer.settings.gapSweepAngle,
          item: item,
          oldItem: (oldLayer?.items)?.getOrNull(i)?.getOrNull(j),
          sliceCursor: _sliceCursor,
          sliceSweepTotal: sliceSweepTotal,
          total: total,
        );
        canvas.drawArc(
          rect,
          item.currentValueStart,
          item.currentValueSweep,
          false,
          paint..color = item.currentValueColor,
        );
        const double twoPi = 2.0 * pi;
        final double circumference = itemRadius * twoPi;
        final double strokeAngle = twoPi * layer.settings.thickness / circumference;
        touchableShapes.add(
          ArcShape<ChartGroupPieDataItem>(
            center: rect.center,
            innerRadius: itemRadius - layer.settings.thickness,
            outerRadius: itemRadius + layer.settings.thickness,
            startAngle: item.currentValueStart - strokeAngle,
            sweepAngle: item.currentValueSweep + 2.0 * strokeAngle,
            data: item,
          ),
        );
      }
    }
  }

  static void _calculate({
    required AnimationController controller,
    required double gapSweepAngle,
    required ChartGroupPieDataItem item,
    required double sliceCursor,
    required double sliceSweepTotal,
    required double total,
    ChartGroupPieDataItem? oldItem,
  }) {
    final double slicePercentage = item.amount * 100.0 / total;
    final double currentSweepDegree = slicePercentage * sliceSweepTotal / 100.0;
    item.setupValue(
      color: item.color,
      controller: controller,
      initialColor: oldItem?.lastValueColor,
      initialSweepAngle: oldItem?.lastValueSweep,
      initialStartAngle:
          oldItem?.lastValueStart != null ? _degreeToRad(_radToDegree(oldItem?.lastValueStart ?? 0.0) - 360.0) : 0.0,
      startAngle: _degreeToRad(sliceCursor + 360.0),
      sweepAngle: _degreeToRad(currentSweepDegree),
    );
    _sliceCursor += currentSweepDegree + gapSweepAngle;
  }

  static double _degreeToRad(double degree) => degree * pi / 180.0;

  static double _radToDegree(double rad) => rad * 180.0 / pi;
}
