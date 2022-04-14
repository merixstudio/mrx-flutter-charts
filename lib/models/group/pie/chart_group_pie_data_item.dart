part of 'chart_group_pie_layer.dart';

class ChartGroupPieDataItem extends ChartDataItem {
  final double amount;
  final Color color;
  final String label;
  final _ChartGroupPieDataItemValue _value;

  ChartGroupPieDataItem({
    required this.amount,
    required this.color,
    required this.label,
  }) : _value = _ChartGroupPieDataItemValue();

  Color get currentValueColor => _value.currentColor;

  double get currentValueStart => _value.currentStart;

  double get currentValueSweep => _value.currentSweep;

  Color get lastValueColor => _value.lastColor;

  double get lastValueStart => _value.lastStart;

  double get lastValueSweep => _value.lastSweep;

  @override
  void dispose() {
    _value.dispose();
  }

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

  Color get currentColor => _color.current;

  double get currentStart => _start.current;

  double get currentSweep => _sweep.current;

  Color get lastColor => _color.last;

  double get lastStart => _start.last;

  double get lastSweep => _sweep.last;

  void dispose() {
    _color.dispose();
    _start.dispose();
    _sweep.dispose();
  }

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
