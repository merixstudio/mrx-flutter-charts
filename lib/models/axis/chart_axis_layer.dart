import 'package:chart/models/animation/chart_animation.dart';
import 'package:chart/models/chart_layer.dart';
import 'package:flutter/material.dart';

part 'data/chart_axis_data.dart';
part 'data/chart_axis_data_item.dart';
part 'settings/chart_axis_settings.dart';
part 'settings/chart_axis_settings_axis.dart';

class ChartAxisLayer extends ChartLayer {
  final ChartAxisData x;
  final ChartAxisData y;
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

  @override
  void dispose() {
    x.dispose();
    y.dispose();
  }
}
