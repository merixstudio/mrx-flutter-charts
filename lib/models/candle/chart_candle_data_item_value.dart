part of 'chart_candle_layer.dart';

class ChartCandleDataItemValue {
  final double max;
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

  Color get currentColor => _color.current;

  Offset get currentPos => _pos.current;

  Size get currentSize => _size.current;

  Color get lastColor => _color.last;

  Offset get lastPos => _pos.last;

  Size get lastSize => _size.last;

  void dispose() {
    _color.dispose();
    _pos.dispose();
    _size.dispose();
  }

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
