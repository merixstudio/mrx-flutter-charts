import 'dart:ui';

/// Base class for touchable shape that allows detect custom object.
abstract class TouchableShape<T> {
  TouchableShape({
    required this.data,
  });

  /// The data of T.
  final T data;

  /// Check object has been clicked.
  bool isHit(Offset offset);
}
