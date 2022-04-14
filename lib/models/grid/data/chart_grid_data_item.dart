part of '../chart_grid_layer.dart';

class ChartGridDataItem {
  final double value;

  final ChartColorAnimation _color;
  final ChartPositionAnimation _endPos;
  final ChartPositionAnimation _startPos;

  ChartGridDataItem({
    required this.value,
  })  : _color = ChartColorAnimation(),
        _endPos = ChartPositionAnimation(),
        _startPos = ChartPositionAnimation();

  Color get currentColor => _color.current;

  Offset get currentEndPos => _endPos.current;

  Offset get currentStartPos => _startPos.current;

  Color get lastColor => _color.last;

  Offset get lastEndPos => _endPos.last;

  Offset get lastStartPos => _startPos.last;

  void dispose() {
    _color.dispose();
    _endPos.dispose();
    _startPos.dispose();
  }

  void setup({
    required AnimationController controller,
    required Color color,
    required Offset endPos,
    required Offset startPos,
    Color? initialColor,
    Offset? initialEndPos,
    Offset? initialStartPos,
    ChartGridDataItem? oldItem,
  }) {
    _color.setup(
      color: color,
      controller: controller,
      initialColor: initialColor,
      oldAnimation: oldItem?._color,
    );
    _endPos.setup(
      controller: controller,
      initialPosition: initialEndPos,
      oldAnimation: oldItem?._endPos,
      position: endPos,
    );
    _startPos.setup(
      controller: controller,
      initialPosition: initialStartPos,
      oldAnimation: oldItem?._startPos,
      position: startPos,
    );
  }
}
