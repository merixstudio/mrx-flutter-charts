part of 'chart_group_bar_layer.dart';

/// Provides data item of group bar.
class ChartGroupBarDataItem extends ChartDataItem {
  /// The color of data item.
  final Color color;

  /// The value of data item.
  final double value;

  /// The axis x of data item.
  final double x;

  final _ChartGroupBarDataItemTouch _touch;
  final _ChartGroupBarDataItemValue _value;

  ChartGroupBarDataItem({
    required this.color,
    required this.value,
    required this.x,
  })  : _touch = _ChartGroupBarDataItemTouch(),
        _value = _ChartGroupBarDataItemValue();

  /// Current touch area position during the animation.
  ///
  /// Default to Offset.zero
  Offset get currentTouchPos => _touch.currentPos;

  /// Current touch area size during the animation.
  ///
  /// Default to Size.zero
  Size get currentTouchSize => _touch.currentSize;

  /// Current color during the animation.
  ///
  /// Default to Colors.transparent
  Color get currentValueColor => _value.currentColor;

  /// Current position during the animation.
  ///
  /// Default to Offset.zero
  Offset get currentValuePos => _value.currentPos;

  /// Current size during the animation.
  ///
  /// Default to Size.zero
  Size get currentValueSize => _value.currentSize;

  /// Last touch area position on finish/stop animation.
  ///
  /// Default to Offset.zero
  Offset get lastTouchPos => _touch.lastPos;

  /// Last touch area size on finish/stop animation.
  ///
  /// Default to Size.zero
  Size get lastTouchSize => _touch.lastSize;

  /// Last color on finish/stop animation.
  ///
  /// Default to Colors.transparent
  Color get lastValueColor => _value.lastColor;

  /// Last position on finish/stop animation.
  ///
  /// Default to Offset.zero
  Offset get lastValuePos => _value.lastPos;

  /// Last size on finish/stop animation.
  ///
  /// Default to Size.zero
  Size get lastValueSize => _value.lastSize;

  /// Dispose all animations.
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

  /// Initialuze value animations.
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

  /// Current position during the animation.
  ///
  /// Default to Offset.zero
  Offset get currentPos => _pos.current;

  /// Current size during the animation.
  ///
  /// Default to Size.zero
  Size get currentSize => _size.current;

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

  /// Current color during the animation.
  ///
  /// Default to Colors.transparent
  Color get currentColor => _color.current;

  /// Current position during the animation.
  ///
  /// Default to Offset.zero
  Offset get currentPos => _pos.current;

  /// Current size during the animation.
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
