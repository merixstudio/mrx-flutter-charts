part of 'chart_bar_layer.dart';

class ChartBarDataItem extends ChartDataItem {
  final Color color;
  final double value;
  final double x;
  final _ChartBarDataItemTouch _touch;
  final _ChartBarDataItemValue _value;

  ChartBarDataItem({
    required this.color,
    required this.value,
    required this.x,
  })  : _touch = _ChartBarDataItemTouch(),
        _value = _ChartBarDataItemValue();

  Offset get currentTouchPos => _touch.currentPos;

  Size get currentTouchSize => _touch.currentSize;

  Color get currentValueColor => _value.currentColor;

  Offset get currentValuePos => _value.currentPos;

  Size get currentValueSize => _value.currentSize;

  Offset get lastTouchPos => _touch.lastPos;

  Size get lastTouchSize => _touch.lastSize;

  Color get lastValueColor => _value.lastColor;

  Offset get lastValuePos => _value.lastPos;

  Size get lastValueSize => _value.lastSize;

  @override
  void dispose() {
    _touch.dispose();
    _value.dispose();
  }

  void setupTouch({
    required AnimationController controller,
    required Offset pos,
    required Size size,
    Offset? initialPos,
    Size? initialSize,
    ChartBarDataItem? oldItem,
  }) {
    _touch.setup(
      controller: controller,
      initialPos: initialPos,
      initialSize: initialSize,
      oldValue: oldItem?._value,
      pos: pos,
      size: size,
    );
  }

  void setupValue({
    required Color color,
    required AnimationController controller,
    required Offset pos,
    required Size size,
    Color? initialColor,
    Offset? initialPos,
    Size? initialSize,
    ChartBarDataItem? oldItem,
  }) {
    _value.setup(
      color: color,
      controller: controller,
      initialColor: initialColor,
      initialPos: initialPos,
      initialSize: initialSize,
      oldValue: oldItem?._value,
      pos: pos,
      size: size,
    );
  }
}

class _ChartBarDataItemTouch {
  final ChartPositionAnimation _pos;
  final ChartSizeAnimation _size;

  _ChartBarDataItemTouch()
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
    _ChartBarDataItemValue? oldValue,
  }) {
    _pos.setup(
      controller: controller,
      curve: Curves.easeInOut,
      initialPosition: initialPos,
      oldAnimation: oldValue?._pos,
      position: pos,
    );
    _size.setup(
      controller: controller,
      curve: Curves.easeInOut,
      initialSize: initialSize,
      oldAnimation: oldValue?._size,
      size: size,
    );
  }
}

class _ChartBarDataItemValue {
  final ChartColorAnimation _color;
  final ChartPositionAnimation _pos;
  final ChartSizeAnimation _size;

  _ChartBarDataItemValue()
      : _color = ChartColorAnimation(),
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
    _ChartBarDataItemValue? oldValue,
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
    _size.setup(
      controller: controller,
      curve: Curves.easeInOut,
      initialSize: initialSize,
      oldAnimation: oldValue?._size,
      size: size,
    );
  }
}
