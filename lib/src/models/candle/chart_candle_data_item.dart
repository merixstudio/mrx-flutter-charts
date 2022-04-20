part of 'chart_candle_layer.dart';

class ChartCandleDataItem {
  final Color color;
  final ChartCandleDataItemValue value1;
  final ChartCandleDataItemValue value2;
  final double x;

  const ChartCandleDataItem({
    required this.color,
    required this.value1,
    required this.value2,
    required this.x,
  });

  void dispose() {
    value1.dispose();
    value2.dispose();
  }
}
