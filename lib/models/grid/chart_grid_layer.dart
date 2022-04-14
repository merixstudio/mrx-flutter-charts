import 'package:chart/models/chart_layer.dart';
import 'package:chart/models/animation/chart_animation.dart';
import 'package:flutter/material.dart';

part 'data/chart_grid_data.dart';
part 'data/chart_grid_data_item.dart';
part 'settings/chart_grid_settings.dart';
part 'settings/chart_grid_settings_axis.dart';

class ChartGridLayer extends ChartLayer {
  final ChartGridData x;
  final ChartGridData y;
  final ChartGridSettings settings;

  ChartGridLayer({
    required this.settings,
  })  : x = settings.x.generate(),
        y = settings.y.generate();

  @override
  void dispose() {
    x.dispose();
    y.dispose();
  }
}
