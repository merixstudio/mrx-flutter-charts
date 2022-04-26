import 'package:mrx_charts/src/models/animation/chart_animation.dart';
import 'package:mrx_charts/src/models/chart_data_item.dart';
import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'chart_line_data_item.dart';
part 'chart_line_settings.dart';

/// This layer allows to render lines.
class ChartLineLayer extends ChartLayer {
  /// The items data of lines.
  final List<ChartLineDataItem> items;

  /// The settings of lines.
  final ChartLineSettings settings;

  const ChartLineLayer({
    required this.items,
    required this.settings,
  });

  /// Disposing all animations.
  @override
  void dispose() {
    for (final ChartLineDataItem item in items) {
      item.dispose();
    }
  }
}
