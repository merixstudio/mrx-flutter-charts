import 'package:flutter/material.dart';
import 'package:mrx_charts/src/models/animation/chart_animation.dart';
import 'package:mrx_charts/src/models/chart_layer.dart';

part 'data/chart_axis_data.dart';
part 'data/chart_axis_data_item.dart';
part 'settings/chart_axis_settings.dart';
part 'settings/chart_axis_settings_axis.dart';

/// Provides paint for axis layer.
class ChartAxisLayer extends ChartLayer {
  /// The x of axis.
  final ChartAxisData x;

  /// The y of axis.
  final ChartAxisData y;

  /// The settings of axis.
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

  /// Dispose all animations.
  @override
  void dispose() {
    x.dispose();
    y.dispose();
  }
}
