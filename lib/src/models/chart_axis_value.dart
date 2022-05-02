/// A collection of values for the selected axis.
class ChartAxisValue {
  /// The max of axis's value.
  final double max;

  /// The min of axis's value.
  final double min;

  const ChartAxisValue({
    required this.max,
    required this.min,
  });

  const ChartAxisValue.empty()
      : max = 0.0,
        min = 0.0;
}
