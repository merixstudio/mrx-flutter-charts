import 'package:flutter/material.dart';

part 'chart_color_animation.dart';
part 'chart_double_animation.dart';
part 'chart_position_animation.dart';
part 'chart_size_animation.dart';
part 'chart_text_style_animation.dart';

/// Base class for animation that allows animation values.
abstract class ChartAnimation {
  void dispose();
}
