import 'package:flutter/material.dart';

class ChartPainterData {
  final Offset position;
  final Size size;

  const ChartPainterData({
    required this.position,
    required this.size,
  });

  const ChartPainterData.empty()
      : position = Offset.zero,
        size = Size.zero;
}
