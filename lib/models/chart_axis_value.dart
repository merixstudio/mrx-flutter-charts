class ChartAxisValue {
  final double max;
  final double min;

  const ChartAxisValue({
    required this.max,
    required this.min,
  });

  const ChartAxisValue.empty()
      : max = 0.0,
        min = 0.0;
}
