part of 'chart_group_bar_layer.dart';

class ChartGroupBarDataItem extends ChartDataItem {
  final Color color;
  final double value;
  final double x;
  final _ChartGroupBarDataItemTouch _touch;
  final _ChartGroupBarDataItemValue _value;

  ChartGroupBarDataItem({
    required this.color,
    required this.value,
    required this.x,
  })  : _touch = _ChartGroupBarDataItemTouch(),
        _value = _ChartGroupBarDataItemValue();

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
    _value.dispose();
  }

  void setupTouch({
    required AnimationController controller,
    required Offset pos,
    required Size size,
    Offset? initialPos,
    Size? initialSize,
    ChartGroupBarDataItem? oldItem,
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
    ChartGroupBarDataItem? oldItem,
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

class _ChartGroupBarDataItemTouch {
  final ChartPositionAnimation _pos;
  final ChartSizeAnimation _size;

  _ChartGroupBarDataItemTouch()
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
    _ChartGroupBarDataItemValue? oldValue,
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

class _ChartGroupBarDataItemValue {
  final ChartColorAnimation _color;
  final ChartPositionAnimation _pos;
  final ChartSizeAnimation _size;

  _ChartGroupBarDataItemValue()
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
    _ChartGroupBarDataItemValue? oldValue,
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
