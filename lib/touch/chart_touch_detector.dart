import 'package:mrx_charts/models/touchable/touchable_shape.dart';
import 'package:flutter/widgets.dart';

class ChartTouchDetector<T> extends StatelessWidget {
  final Widget? child;
  final void Function(Offset touchPosition, T? data)? onTap;
  final List<TouchableShape<T>>? shapes;
  final List<TouchableShape<T>> Function() onShapes;

  const ChartTouchDetector({
    required this.onShapes,
    this.child,
    this.onTap,
    this.shapes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
