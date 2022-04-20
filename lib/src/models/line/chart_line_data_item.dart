part of 'chart_line_layer.dart';

class ChartLineDataItem extends ChartDataItem {
  final double value;
  final double x;
  final _ChartLineDataItemTouch _touch;
  final _ChartLineDataItemValue _value;

  ChartLineDataItem({
    required this.value,
    required this.x,
  })  : _touch = _ChartLineDataItemTouch(),
        _value = _ChartLineDataItemValue();

  Offset get currentTouchPos => _touch.currentPos;

  Size get currentTouchSize => _touch.currentSize;

  Color get currentValueColor => _value.currentColor;

  Offset get currentValuePos => _value.currentPos;

  Offset get lastTouchPos => _touch.lastPos;

  Size get lastTouchSize => _touch.lastSize;

  Color get lastValueColor => _value.lastColor;

  Offset get lastValuePos => _value.lastPos;

  @override
  void dispose() {
    _value.dispose();
  }

  void setupTouch({
    required AnimationController controller,
    required Offset pos,
    required Size size,
    Offset? initialPos,
    Size? initialSize,
    ChartLineDataItem? oldItem,
  }) {
    _touch.setup(
      controller: controller,
      initialPos: initialPos,
      initialSize: initialSize,
      oldValue: oldItem?._touch,
      pos: pos,
      size: size,
    );
  }

  void setupValue({
    required AnimationController controller,
    required Color color,
    required Offset pos,
    Color? initialColor,
    Offset? initialPos,
    ChartLineDataItem? oldItem,
  }) {
    _value.setup(
      color: color,
      controller: controller,
      initialColor: initialColor,
      initialPos: initialPos,
      oldValue: oldItem?._value,
      pos: pos,
    );
  }
}

class _ChartLineDataItemTouch {
  final ChartPositionAnimation _pos;
  final ChartSizeAnimation _size;

  _ChartLineDataItemTouch()
      : _pos = ChartPositionAnimation(),
        _size = ChartSizeAnimation();

  Offset get currentPos => _pos.current;

  Size get currentSize => _size.current;

  Offset get lastPos => _pos.last;

  Size get lastSize => _size.last;

  void dispose() {
    _pos.dispose();
    _size.dispose();
  }

  void setup({
    required AnimationController controller,
    required Offset pos,
    required Size size,
    Offset? initialPos,
    Size? initialSize,
    _ChartLineDataItemTouch? oldValue,
  }) {
    _pos.setup(
      controller: controller,
      initialPosition: initialPos,
      oldAnimation: oldValue?._pos,
      position: pos,
    );
    _size.setup(
      controller: controller,
      initialSize: initialSize,
      oldAnimation: oldValue?._size,
      size: size,
    );
  }
}

class _ChartLineDataItemValue {
  final ChartColorAnimation _color;
  final ChartPositionAnimation _pos;

  _ChartLineDataItemValue()
      : _color = ChartColorAnimation(),
        _pos = ChartPositionAnimation();

  Color get currentColor => _color.current;

  Offset get currentPos => _pos.current;

  Color get lastColor => _color.last;

  Offset get lastPos => _pos.last;

  void dispose() {
    _color.dispose();
    _pos.dispose();
  }

  void setup({
    required AnimationController controller,
    required Color color,
    required Offset pos,
    Color? initialColor,
    Offset? initialPos,
    _ChartLineDataItemValue? oldValue,
  }) {
    _color.setup(
      color: color,
      controller: controller,
      initialColor: initialColor,
      oldAnimation: oldValue?._color,
    );
    _pos.setup(
      controller: controller,
      curve: Curves.easeInOut,
      initialPosition: initialPos,
      oldAnimation: oldValue?._pos,
      position: pos,
    );
  }
}
