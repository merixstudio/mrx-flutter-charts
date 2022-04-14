import 'package:chart/models/chart_data_item.dart';
import 'package:chart/models/chart_layer.dart';
import 'package:chart/models/touchable/touchable_shape.dart';
import 'package:chart/painter/chart_painter.dart';
import 'package:chart/touch/chart_touch_detector.dart';
import 'package:chart/touch/stock_touch_callback_data.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  final Duration duration;
  final List<ChartLayer> layers;
  final EdgeInsets padding;

  const Chart({
    this.duration = const Duration(
      milliseconds: 300,
    ),
    this.layers = const [],
    this.padding = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> with TickerProviderStateMixin {
  late final AnimationController _controller;
  List<ChartLayer>? oldLayers;
  List<TouchableShape<ChartDataItem>> _touchableShapes = [];
  ChartTouchCallbackData? _touchedData;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => _controller
        ..stop()
        ..reset()
        ..forward(),
    );
  }

  @override
  void didUpdateWidget(covariant Chart oldWidget) {
    if (widget.layers != oldWidget.layers) {
      setState(() {
        oldLayers = oldWidget.layers;
        _touchedData = null;
        _disposeOldLayers();
        _controller
          ..stop()
          ..reset()
          ..forward();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, __) => ChartTouchDetector<dynamic>(
              onShapes: () => _touchableShapes,
              onTap: ((touchPosition, data) => setState(() {
                    _touchedData = data == null
                        ? null
                        : ChartTouchCallbackData(
                            clickedPos: touchPosition,
                            selectedItem: data,
                          );
                  })),
              child: CustomPaint(
                painter: ChartPainter(
                  controller: _controller,
                  layers: widget.layers,
                  oldLayers: oldLayers,
                  onUpdateTouchableShapes: (shapes) => _touchableShapes = shapes,
                  padding: widget.padding,
                  touchedData: _touchedData,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _disposeOldLayers() {
    for (final ChartLayer layer in oldLayers ?? []) {
      layer.dispose();
    }
  }
}