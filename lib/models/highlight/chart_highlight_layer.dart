import 'package:chart/models/chart_layer.dart';
import 'package:chart/models/highlight/shape/chart_highlight_shape.dart';

class ChartHighlightLayer extends ChartLayer {
  final ChartHighlightShape Function() shape;

  const ChartHighlightLayer({
    required this.shape,
  });

  @override
  void dispose() {}
}
