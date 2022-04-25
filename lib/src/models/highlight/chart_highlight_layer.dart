import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:mrx_charts/src/models/highlight/shape/chart_highlight_shape.dart';

/// Provides paint for highlight layer.
class ChartHighlightLayer extends ChartLayer {
  /// The function return selected shape.
  final ChartHighlightShape Function() shape;

  const ChartHighlightLayer({
    required this.shape,
  });

  /// Dispose all animations.
  @override
  void dispose() {}
}
