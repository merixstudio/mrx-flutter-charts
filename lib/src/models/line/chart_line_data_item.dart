part of 'chart_line_layer.dart';

/// A collection of values for a line in a chart.
class ChartLineDataItem extends ChartDataItem {
  /// The value of data item.
  final double value;

  /// The axis x of data item.
  final double x;

  final _ChartLineDataItemTouch _touch;
  final _ChartLineDataItemValue _value;

  ChartLineDataItem({
    required this.value,
    required this.x,
  })  : _touch = _ChartLineDataItemTouch(),
        _value = _ChartLineDataItemValue();

  /// Current touch area position during the animation.
  ///
  /// Defaults to Offset.zero
  Offset get currentTouchPos => _touch.currentPos;

  /// Current touch area size during the animation.
  ///
  /// Defaults to Size.zero
  Size get currentTouchSize => _touch.currentSize;

  /// Current color during the animation.
  ///
  /// Defaults to Colors.transparent
  Color get currentValueColor => _value.currentColor;

  /// Current position during the animation.
  ///
  /// Defaults to Offset.zero
  Offset get currentValuePos => _value.currentPos;

  /// Last touch area position on finish/stop animation.
  ///
  /// Defaults to Offset.zero
  Offset get lastTouchPos => _touch.lastPos;

  /// Last touch area size on finish/stop animation.
  ///
  /// Defaults to Size.zero
  Size get lastTouchSize => _touch.lastSize;

  /// Last color on finish/stop animation.
  ///
  /// Defaults to Colors.transparent
  Color get lastValueColor => _value.lastColor;

  /// Last position on finish/stop animation.
  ///
  /// Defaults to Offset.zero
  Offset get lastValuePos => _value.lastPos;

  /// Disposing all animations.
  @override
  void dispose() {
    _value.dispose();
  }

  /// Initialize touch area animations.
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

  /// Initialuze value animations.
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

  /// Current position during the animation.
  ///
  /// Defaults to Offset.zero
  Offset get currentPos => _pos.current;

  /// Current size during the animation.
  ///
  /// Defaults to Size.zero
  Size get currentSize => _size.current;

  /// Last position on finish/stop animation.
  ///
  /// Defaults to Offset.zero
  Offset get lastPos => _pos.last;

  /// Last size on finish/stop animation.
  ///
  /// Defaults to Size.zero
  Size get lastSize => _size.last;

  /// Disposing all animations.
  void dispose() {
    _pos.dispose();
    _size.dispose();
  }

  /// Initialize animations.
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

  /// Current color during the animation.
  ///
  /// Defaults to Colors.transparent
  Color get currentColor => _color.current;

  /// Current position during the animation.
  ///
  /// Defaults to Offset.zero
  Offset get currentPos => _pos.current;

  /// Last color on finish/stop animation.
  ///
  /// Defaults to Colors.transparent
  Color get lastColor => _color.last;

  /// Last position on finish/stop animation.
  ///
  /// Defaults to Offset.zero
  Offset get lastPos => _pos.last;

  /// Disposing all animations.
  void dispose() {
    _color.dispose();
    _pos.dispose();
  }

  /// Initialize animations.
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
