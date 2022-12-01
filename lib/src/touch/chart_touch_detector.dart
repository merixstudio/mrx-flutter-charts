import 'package:flutter/material.dart';
import 'package:mrx_charts/src/models/enum/chart_touch_type.dart';
import 'package:mrx_charts/src/models/touchable/touchable_shape.dart';
import 'package:flutter/widgets.dart';

/// Provides touch detector.
class ChartTouchDetector<T> extends StatelessWidget {
  final Widget? child;

  /// The function reacted by tap on widget.
  final void Function(Offset touchPosition, T? data)? onTap;

  /// The list of shapes.
  final List<TouchableShape<T>>? shapes;

  /// The function return list of shapes.
  final List<TouchableShape<T>> Function() onShapes;

  // The type of method click.
  final ChartTouchType type;

  const ChartTouchDetector({
    required this.onShapes,
    this.type = ChartTouchType.click,
    this.child,
    this.onTap,
    this.shapes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == ChartTouchType.hover) {
      return MouseRegion(
        onHover: (event) {
          if (onTap == null) {
            return;
          }
          for (final TouchableShape<T> shape in onShapes()) {
            if (shape.isHit(event.localPosition)) {
              onTap?.call(event.localPosition, shape.data);
              return;
            }
          }
          onTap?.call(event.localPosition, null);
        },
        child: child,
      );
    }
    return GestureDetector(
      onTapUp: (TapUpDetails tapUpDetails) {
        if (onTap == null) {
          return;
        }
        for (final TouchableShape<T> shape in onShapes()) {
          if (shape.isHit(tapUpDetails.localPosition)) {
            onTap?.call(tapUpDetails.localPosition, shape.data);
            return;
          }
        }
        onTap?.call(tapUpDetails.localPosition, null);
      },
      child: child,
    );
  }
}
