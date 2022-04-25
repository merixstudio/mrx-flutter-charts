part of 'chart_group_pie_layer.dart';

/// Provides data item of pie.
class ChartGroupPieDataItem extends ChartDataItem {
  /// The amount of data item.
  final double amount;

  /// The color of data item.
  final Color color;

  /// The label of data item.
  final String label;

  final _ChartGroupPieDataItemValue _value;

  ChartGroupPieDataItem({
    required this.amount,
    required this.color,
    required this.label,
  }) : _value = _ChartGroupPieDataItemValue();

  /// Current color value in while animation.
  ///
  /// Default to Colors.transparent
  Color get currentValueColor => _value.currentColor;

  /// Current double start in while animation.
  ///
  /// Default to 0.0
  double get currentValueStart => _value.currentStart;

  /// Current double sweep in while animation.
  ///
  /// Default to 0.0
  double get currentValueSweep => _value.currentSweep;

  /// Last color value on finish/stop animation.
  ///
  /// Default to Colors.transparent
  Color get lastValueColor => _value.lastColor;

  /// Last double start on finish/stop animation.
  ///
  /// Default to 0.0
  double get lastValueStart => _value.lastStart;

  /// Last double sweep on finish/stop animation.
  ///
  /// Default to 0.0
  double get lastValueSweep => _value.lastSweep;

  /// Dispose all animations.
  @override
  void dispose() {
    _value.dispose();
  }

  /// Initialize animations.
  void setupValue({
    required AnimationController controller,
    required Color color,
    required double startAngle,
    required double sweepAngle,
    Color? initialColor,
    double? initialStartAngle,
    double? initialSweepAngle,
    ChartGroupPieDataItem? oldItem,
  }) {
    _value.setup(
      color: color,
      controller: controller,
      initialColor: initialColor,
      initialStartAngle: initialStartAngle,
      initialSweepAngle: initialSweepAngle,
      oldAnimation: oldItem?._value,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );
  }
}

class _ChartGroupPieDataItemValue {
  final ChartColorAnimation _color;
  final ChartDoubleAnimation _start;
  final ChartDoubleAnimation _sweep;

  _ChartGroupPieDataItemValue()
      : _color = ChartColorAnimation(),
        _start = ChartDoubleAnimation(),
        _sweep = ChartDoubleAnimation();

  /// Current color value in while animation.
  ///
  /// Default to Colors.transparent
  Color get currentColor => _color.current;

  /// Current double start in while animation.
  ///
  /// Default to 0.0
  double get currentStart => _start.current;

  /// Current double sweep in while animation.
  ///
  /// Default to 0.0
  double get currentSweep => _sweep.current;

  /// Last color value on finish/stop animation.
  ///
  /// Default to Colors.transparent
  Color get lastColor => _color.last;

  /// Last double start on finish/stop animation.
  ///
  /// Default to 0.0
  double get lastStart => _start.last;

  /// Last double sweep on finish/stop animation.
  ///
  /// Default to 0.0
  double get lastSweep => _sweep.last;

  /// Dispose all animations.
  void dispose() {
    _color.dispose();
    _start.dispose();
    _sweep.dispose();
  }

  /// Initialize animations.
  void setup({
    required AnimationController controller,
    required Color color,
    required double startAngle,
    required double sweepAngle,
    Color? initialColor,
    double? initialStartAngle,
    double? initialSweepAngle,
    _ChartGroupPieDataItemValue? oldAnimation,
  }) {
    _color.setup(
      color: color,
      controller: controller,
      initialColor: initialColor,
      oldAnimation: oldAnimation?._color,
    );
    _start.setup(
      controller: controller,
      curve: Curves.easeInOutExpo,
      initialValue: initialStartAngle,
      oldAnimation: oldAnimation?._start,
      value: startAngle,
    );
    _sweep.setup(
      controller: controller,
      curve: Curves.easeInOutExpo,
      initialValue: initialSweepAngle,
      oldAnimation: oldAnimation?._sweep,
      value: sweepAngle,
    );
  }
}
