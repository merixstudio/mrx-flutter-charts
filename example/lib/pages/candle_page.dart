import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mrx_charts/chart.dart';
import 'package:mrx_charts/models/axis/chart_axis_layer.dart';
import 'package:mrx_charts/models/candle/chart_candle_layer.dart';
import 'package:mrx_charts/models/chart_layer.dart';
import 'package:mrx_charts/models/grid/chart_grid_layer.dart';

class CandlePage extends StatefulWidget {
  const CandlePage({Key? key}) : super(key: key);

  @override
  State<CandlePage> createState() => _CandlePageState();
}

class _CandlePageState extends State<CandlePage> {
  bool _whichCandleMock = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
            ),
            child: GestureDetector(
              onTap: () => setState(() {}),
              child: const Icon(
                Icons.refresh,
                size: 26.0,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Candle'),
      ),
      backgroundColor: const Color(0xFF1B0E41),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 400.0,
            maxWidth: 600.0,
          ),
          padding: const EdgeInsets.all(24.0),
          child: Chart(
            layers: layers(),
            padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(
              bottom: 12.0,
            ),
          ),
        ),
      ),
    );
  }

  List<ChartLayer> layers() {
    _whichCandleMock = !_whichCandleMock;
    final double frequency =
        (DateTime(2017, 11).millisecondsSinceEpoch.toDouble() - DateTime(2017, 4).millisecondsSinceEpoch.toDouble()) /
            4;
    final double frequencyData = frequency / 3;
    final double from = DateTime(2017, 4).millisecondsSinceEpoch.toDouble();
    return [
      ChartGridLayer(
        settings: ChartGridSettings(
          x: ChartGridSettingsAxis(
            color: Colors.white.withOpacity(0.2),
            frequency: frequency,
            max: DateTime(2017, 11).millisecondsSinceEpoch.toDouble(),
            min: DateTime(2017, 4).millisecondsSinceEpoch.toDouble(),
          ),
          y: ChartGridSettingsAxis(
            color: Colors.white.withOpacity(0.2),
            frequency: 3.0,
            max: 66.0,
            min: 48.0,
          ),
        ),
      ),
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: frequency,
            max: DateTime(2017, 11).millisecondsSinceEpoch.toDouble(),
            min: DateTime(2017, 4).millisecondsSinceEpoch.toDouble(),
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 3.0,
            max: 66.0,
            min: 48.0,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => DateFormat('MMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),
        labelY: (value) => value.toInt().toString(),
      ),
      ChartCandleLayer(
        items: _whichCandleMock
            ? [
                _candleItem(Colors.green, 50.0, 52.0, 48.0, 53.0, from),
                _candleItem(Colors.red, 52.0, 54.0, 51.0, 57.0, from + frequencyData),
                _candleItem(Colors.red, 53.0, 56.0, 53.0, 56.0, from + 2 * frequencyData),
                _candleItem(Colors.green, 54.0, 56.0, 53.0, 58.0, from + 3 * frequencyData),
                _candleItem(Colors.green, 55.0, 57.0, 53.0, 58.0, from + 4 * frequencyData),
                _candleItem(Colors.green, 56.0, 58.0, 56.0, 58.0, from + 5 * frequencyData),
                _candleItem(Colors.red, 58.0, 60.0, 57.0, 61.0, from + 6 * frequencyData),
                _candleItem(Colors.green, 57.5, 59.0, 56.5, 60.3, from + 7 * frequencyData),
                _candleItem(Colors.green, 57.0, 59.0, 57.0, 60.0, from + 8 * frequencyData),
                _candleItem(Colors.red, 60.0, 62.0, 57.0, 61.0, from + 9 * frequencyData),
                _candleItem(Colors.green, 63.0, 65.0, 62.0, 66.0, from + 10 * frequencyData),
                _candleItem(Colors.green, 64.0, 66.0, 63.0, 66.0, from + 11 * frequencyData),
                _candleItem(Colors.red, 62.0, 64.0, 61.0, 64.0, from + 12 * frequencyData),
              ]
            : [
                _candleItem(Colors.red, 62.0, 64.0, 61.0, 64.0, from),
                _candleItem(Colors.green, 64.0, 66.0, 63.0, 66.0, from + frequencyData),
                _candleItem(Colors.green, 63.0, 65.0, 62.0, 66.0, from + 2 * frequencyData),
                _candleItem(Colors.red, 60.0, 62.0, 57.0, 61.0, from + 3 * frequencyData),
                _candleItem(Colors.green, 57.0, 59.0, 57.0, 60.0, from + 4 * frequencyData),
                _candleItem(Colors.green, 57.5, 59.0, 56.5, 60.3, from + 5 * frequencyData),
                _candleItem(Colors.red, 58.0, 60.0, 57.0, 61.0, from + 6 * frequencyData),
                _candleItem(Colors.green, 56.0, 58.0, 56.0, 58.0, from + 7 * frequencyData),
                _candleItem(Colors.green, 55.0, 57.0, 53.0, 58.0, from + 8 * frequencyData),
                _candleItem(Colors.green, 54.0, 56.0, 53.0, 58.0, from + 9 * frequencyData),
                _candleItem(Colors.red, 53.0, 56.0, 53.0, 56.0, from + 10 * frequencyData),
                _candleItem(Colors.red, 52.0, 54.0, 51.0, 57.0, from + 11 * frequencyData),
                _candleItem(Colors.green, 50.0, 52.0, 48.0, 53.0, from + 12 * frequencyData),
              ],
        settings: const ChartCandleSettings(),
      ),
    ];
  }

  static _candleItem(Color color, double min1, double max1, double min2, double max2, double x) {
    return ChartCandleDataItem(
      color: color,
      value1: ChartCandleDataItemValue(
        max: max1,
        min: min1,
      ),
      value2: ChartCandleDataItemValue(
        max: max2,
        min: min2,
      ),
      x: x,
    );
  }
}
