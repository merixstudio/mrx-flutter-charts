part of 'chart_candle_layer.dart';

/// Provides data item of candle.
class ChartCandleDataItemValue {
  /// The max of data item.
  final double max;

  /// The min of data item.
  final double min;

  final ChartColorAnimation _color;
  final ChartPositionAnimation _pos;
  final ChartSizeAnimation _size;

  ChartCandleDataItemValue({
    required this.max,
    required this.min,
  })  : _color = ChartColorAnimation(),
        _pos = ChartPositionAnimation(),
        _size = ChartSizeAnimation();

  /// Current color in while animation.
  ///
  /// Default to Colors.transparent
  Color get currentColor => _color.current;

  /// Current position in while animation.
  ///
  /// Default to Offset.zero
  Offset get currentPos => _pos.current;

  /// Current size in while animation.
  ///
  /// Default to Size.zero
  Size get currentSize => _size.current;

  /// Last color on finish/stop animation.
  ///
  /// Default to Colors.transparent
  Color get lastColor => _color.last;

  /// Last position on finish/stop animation.
  ///
  /// Default to Offset.zero
  Offset get lastPos => _pos.last;

  /// Last size on finish/stop animation.
  ///
  /// Default to Size.zero
  Size get lastSize => _size.last;

  /// Dispose all animations.
  void dispose() {
    _color.dispose();
    _pos.dispose();
    _size.dispose();
  }

  /// Initialize animations.
  ///
  void setup({
    required Color color,
    required AnimationController controller,
    required Offset pos,
    required Size size,
    Color? initialColor,
    Offset? initialPos,
    Size? initialSize,
    ChartCandleDataItemValue? oldItem,
  }) {
    _color.setup(
      color: color,
      controller: controller,
      initialColor: initialColor,
      oldAnimation: oldItem?._color,
    );
    _pos.setup(
      controller: controller,
      initialPosition: initialPos,
      oldAnimation: oldItem?._pos,
      position: pos,
    );
    _size.setup(
      controller: controller,
      initialSize: initialSize,
      oldAnimation: oldItem?._size,
      size: size,
    );
  }
}
