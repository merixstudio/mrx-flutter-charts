import 'package:mrx_charts/models/chart_layer.dart';
import 'package:mrx_charts/models/highlight/shape/chart_highlight_shape.dart';

class ChartHighlightLayer extends ChartLayer {
  final ChartHighlightShape Function() shape;

  const ChartHighlightLayer({
    required this.shape,
  });

  @override
  void dispose() {}
}
