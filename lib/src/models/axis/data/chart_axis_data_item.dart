part of '../chart_axis_layer.dart';

class ChartAxisDataItem {
  final String label;
  final double value;

  final ChartPositionAnimation _pos;
  final ChartTextStyleAnimation _textStyle;

  ChartAxisDataItem({
    required this.label,
    required this.value,
  })  : _pos = ChartPositionAnimation(),
        _textStyle = ChartTextStyleAnimation();

  Offset get currentPos => _pos.current;

  TextStyle get currentTextStyle => _textStyle.current;

  Offset get lastPos => _pos.last;

  TextStyle get lastTextStyle => _textStyle.last;

  void dispose() {
    _pos.dispose();
    _textStyle.dispose();
  }

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
