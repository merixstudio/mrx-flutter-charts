import 'package:flutter/material.dart';

/// A collection values for painter data.
class ChartPainterData {
  /// The position of painter object.
  final Offset position;

  /// The size of painter object.
  final Size size;

  const ChartPainterData({
    required this.position,
    required this.size,
  });

  const ChartPainterData.empty()
      : position = Offset.zero,
        size = Size.zero;
}
