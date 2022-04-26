part of '../chart_axis_layer.dart';

/// A collection of values for an axis in a chart.
class ChartAxisDataItem {
  /// The label of data item.
  final String label;

  /// The value of data item.
  final double value;

  final ChartPositionAnimation _pos;
  final ChartTextStyleAnimation _textStyle;

  ChartAxisDataItem({
    required this.label,
    required this.value,
  })  : _pos = ChartPositionAnimation(),
        _textStyle = ChartTextStyleAnimation();

  /// Current position during the animation.
  ///
  /// Defaults to Offset.zero
  Offset get currentPos => _pos.current;

  /// Current TextStyle during the animation.
  ///
  /// Defaults to TextStyle(color: Colors.transparent)
  TextStyle get currentTextStyle => _textStyle.current;

  /// Last position on finish/stop animation.
  ///
  /// Defaults to Offset.zero
  Offset get lastPos => _pos.last;

  /// Last TextStyle on finish/stop animation.
  ///
  /// Defaults to TextStyle(color: Colors.transparent)
  TextStyle get lastTextStyle => _textStyle.last;

  /// Disposing all animations.
  void dispose() {
    _pos.dispose();
    _textStyle.dispose();
  }

  /// Initialize animation.
  void setup({
    required AnimationController controller,
    required Offset pos,
    required TextStyle textStyle,
    Offset? initialPos,
    TextStyle? initialTextStyle,
    ChartAxisDataItem? oldItem,
  }) {
    _pos.setup(
      controller: controller,
      initialPosition: initialPos,
      oldAnimation: oldItem?._pos,
      position: pos,
    );
    _textStyle.setup(
      controller: controller,
      initialTextSyle: initialTextStyle,
      oldAnimation: oldItem?._textStyle,
      textStyle: textStyle,
    );
  }
}
