import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:mrx_charts/src/models/tooltip/shape/chart_tooltip_shape.dart';

/// Provides paint for tooltip layer.
class ChartTooltipLayer<T> extends ChartLayer {
  /// The function return selected shape.
  final ChartTooltipShape Function() shape;

  const ChartTooltipLayer({
    required this.shape,
  });

  /// Dispose all animations.
  @override
  void dispose() {}
}
