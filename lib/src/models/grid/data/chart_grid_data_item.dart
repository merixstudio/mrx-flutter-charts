part of '../chart_grid_layer.dart';

/// Provides data item of grid.
class ChartGridDataItem {
  /// The value of data item.
  final double value;

  final ChartColorAnimation _color;
  final ChartPositionAnimation _endPos;
  final ChartPositionAnimation _startPos;

  ChartGridDataItem({
    required this.value,
  })  : _color = ChartColorAnimation(),
        _endPos = ChartPositionAnimation(),
        _startPos = ChartPositionAnimation();

  /// Current color in while animation.
  ///
  /// Default to Colors.transparent
  Color get currentColor => _color.current;

  /// Current end position in while animation.
  ///
  /// Default to Offset.zero
  Offset get currentEndPos => _endPos.current;

  /// Current start position in while animation.
  ///
  /// Default to Offset.zero
  Offset get currentStartPos => _startPos.current;

  /// Last color on finish/stop animation.
  ///
  /// Default to Colors.transparent
  Color get lastColor => _color.last;

  /// Last end position on finish/stop animation.
  ///
  /// Default to Offset.zero
  Offset get lastEndPos => _endPos.last;

  /// Last start position on finish/stop animation.
  ///
  /// Default to Offset.zero
  Offset get lastStartPos => _startPos.last;

  /// Dispose all animations.
  void dispose() {
    _color.dispose();
    _endPos.dispose();
    _startPos.dispose();
  }

  /// Initialize animations.
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
