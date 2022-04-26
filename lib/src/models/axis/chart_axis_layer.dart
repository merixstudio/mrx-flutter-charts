import 'package:flutter/material.dart';
import 'package:mrx_charts/src/models/animation/chart_animation.dart';
import 'package:mrx_charts/src/models/chart_layer.dart';

part 'data/chart_axis_data.dart';
part 'data/chart_axis_data_item.dart';
part 'settings/chart_axis_settings.dart';
part 'settings/chart_axis_settings_axis.dart';

/// This layer allows to render axises.
class ChartAxisLayer extends ChartLayer {
  /// The x of the axis.
  final ChartAxisData x;

  /// The y of the axis.
  final ChartAxisData y;

  /// The settings of the axis.
  final ChartAxisSettings settings;

  ChartAxisLayer({
    required String Function(double) labelX,
    required String Function(double) labelY,
    required this.settings,
  })  : x = settings.x.generate(
          label: labelX,
        ),
        y = settings.y.generate(
          label: labelY,
        );

  /// Disposing all animations.
  @override
  void dispose() {
    x.dispose();
    y.dispose();
  }
}
