import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:mrx_charts/src/models/tooltip/shape/chart_tooltip_shape.dart';

class ChartTooltipLayer<T> extends ChartLayer {
  final ChartTooltipShape Function() shape;

  const ChartTooltipLayer({
    required this.shape,
  });

  @override
  void dispose() {}
}
