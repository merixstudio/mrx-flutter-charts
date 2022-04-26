import 'package:mrx_charts/src/models/chart_layer.dart';
import 'package:mrx_charts/src/models/animation/chart_animation.dart';
import 'package:flutter/material.dart';

part 'data/chart_grid_data.dart';
part 'data/chart_grid_data_item.dart';
part 'settings/chart_grid_settings.dart';
part 'settings/chart_grid_settings_axis.dart';

/// This layer allows to render grids.
class ChartGridLayer extends ChartLayer {
  /// The x axis of grid.
  final ChartGridData x;

  /// The y axis of grid.
  final ChartGridData y;

  /// The settings of grid.
  final ChartGridSettings settings;

  ChartGridLayer({
    required this.settings,
  })  : x = settings.x.generate(),
        y = settings.y.generate();

  /// Disposing all animations.
  @override
  void dispose() {
    x.dispose();
    y.dispose();
  }
}
