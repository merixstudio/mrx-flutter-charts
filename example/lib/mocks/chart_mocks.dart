import 'dart:math';

import 'package:chart/models/axis/chart_axis_layer.dart';
import 'package:chart/models/bar/chart_bar_layer.dart';
import 'package:chart/models/candle/chart_candle_layer.dart';
import 'package:chart/models/chart_layer.dart';
import 'package:chart/models/grid/chart_grid_layer.dart';
import 'package:chart/models/group/bar/chart_group_bar_layer.dart';
import 'package:chart/models/group/pie/chart_group_pie_layer.dart';
import 'package:chart/models/highlight/chart_highlight_layer.dart';
import 'package:chart/models/highlight/shape/chart_highlight_shape.dart';
import 'package:chart/models/line/chart_line_layer.dart';
import 'package:chart/models/tooltip/chart_tooltip_layer.dart';
import 'package:chart/models/tooltip/shape/chart_tooltip_shape.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartMocks {
  const ChartMocks._();

  static List<ChartLayer> exampleBar() {
    return [
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: 1.0,
            max: 13.0,
            min: 7.0,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 100.0,
            max: 300.0,
            min: 0.0,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => value.toInt().toString(),
        labelY: (value) => value.toInt().toString(),
      ),
      ChartBarLayer(
        items: List.generate(
          13 - 7 + 1,
          (index) => ChartBarDataItem(
            color: const Color(0xFF8043F9),
            value: Random().nextInt(280) + 20,
            x: index.toDouble() + 7,
          ),
        ),
        settings: const ChartBarSettings(
          thickness: 8.0,
          radius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    ];
  }

  static List<ChartLayer> exampleGroupBar() {
    return [
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: 1.0,
            max: 12.0,
            min: 7.0,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 100.0,
            max: 300.0,
            min: 0.0,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => value.toInt().toString(),
        labelY: (value) => value.toInt().toString(),
      ),
      ChartGroupBarLayer(
        items: List.generate(
          12 - 7 + 1,
          (index) => [
            ChartGroupBarDataItem(
              color: const Color(0xFF8043F9),
              x: index + 7,
              value: Random().nextInt(280) + 20,
            ),
            ChartGroupBarDataItem(
              color: const Color(0xFFFF4150),
              x: index + 7,
              value: Random().nextInt(280) + 20,
            ),
          ],
        ),
        settings: const ChartGroupBarSettings(
          thickness: 8.0,
          radius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipBarShape<ChartGroupBarDataItem>(
          backgroundColor: Colors.white,
          currentPos: (item) => item.currentValuePos,
          currentSize: (item) => item.currentValueSize,
          onTextValue: (item) => '€${item.value.toString()}',
          marginBottom: 6.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          radius: 6.0,
          textStyle: const TextStyle(
            color: Color(0xFF8043F9),
            letterSpacing: 0.2,
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
  }

  static List<ChartLayer> exampleLine() {
    final from = DateTime(2021, 4);
    final to = DateTime(2021, 8);
    final frequency = (to.millisecondsSinceEpoch - from.millisecondsSinceEpoch) / 3.0;
    return [
      ChartHighlightLayer(
        shape: () => ChartHighlightLineShape<ChartLineDataItem>(
          backgroundColor: const Color(0xFF331B6D),
          currentPos: (item) => item.currentValuePos,
          radius: const BorderRadius.all(Radius.circular(8.0)),
          width: 60.0,
        ),
      ),
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: frequency,
            max: to.millisecondsSinceEpoch.toDouble(),
            min: from.millisecondsSinceEpoch.toDouble(),
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 100.0,
            max: 400.0,
            min: 0.0,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => DateFormat('MMM').format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),
        labelY: (value) => value.toInt().toString(),
      ),
      ChartLineLayer(
        items: List.generate(
          4,
          (index) => ChartLineDataItem(
            x: (index * frequency) + from.millisecondsSinceEpoch,
            value: Random().nextInt(380) + 20,
          ),
        ),
        settings: const ChartLineSettings(
          color: Color(0xFF8043F9),
          thickness: 4.0,
        ),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipLineShape<ChartLineDataItem>(
          backgroundColor: Colors.white,
          circleBackgroundColor: Colors.white,
          circleBorderColor: const Color(0xFF331B6D),
          circleSize: 4.0,
          circleBorderThickness: 2.0,
          currentPos: (item) => item.currentValuePos,
          onTextValue: (item) => '€${item.value.toString()}',
          marginBottom: 6.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          radius: 6.0,
          textStyle: const TextStyle(
            color: Color(0xFF8043F9),
            letterSpacing: 0.2,
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
  }

  static List<ChartLayer> exampleGroupPie() {
    return [
      ChartGroupPieLayer(
        items: List.generate(
          2,
          (index) => List.generate(
            Random().nextInt(4) + 2,
            (index) => ChartGroupPieDataItem(
                amount: Random().nextInt(300) * Random().nextDouble(),
                color: [
                  Colors.orangeAccent,
                  Colors.pinkAccent,
                  Colors.redAccent,
                  Colors.blueAccent,
                  Colors.cyanAccent,
                  Colors.tealAccent,
                ][Random().nextInt(6)],
                label: [
                  'Life',
                  'Work',
                  'Medicine',
                  'Bills',
                  'Hobby',
                  'Holiday',
                ][Random().nextInt(6)]),
          ),
        ),
        settings: const ChartGroupPieSettings(),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipPieShape<ChartGroupPieDataItem>(
          onTextName: (item) => item.label,
          onTextValue: (item) => '€${item.amount.toString()}',
          radius: 10.0,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(12.0),
          nameTextStyle: const TextStyle(
            color: Color(0xFF8043F9),
            fontWeight: FontWeight.w700,
            height: 1.47,
            fontSize: 12.0,
          ),
          valueTextStyle: const TextStyle(
            color: Color(0xFF1B0E41),
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
          ),
        ),
      )
    ];
  }

  static bool _whichCandleMock = true;

  static List<ChartLayer> exampleCandle() {
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

  static List<ChartLayer> groupPie() {
    return [
      ChartGroupPieLayer(
        items: List.generate(
          3,
          (index) => List.generate(
            Random().nextInt(4) + 2,
            (index) => ChartGroupPieDataItem(
                amount: Random().nextInt(300) * Random().nextDouble(),
                color: [
                  Colors.orangeAccent,
                  Colors.pinkAccent,
                  Colors.redAccent,
                  Colors.blueAccent,
                  Colors.cyanAccent,
                  Colors.tealAccent,
                ][Random().nextInt(6)],
                label: [
                  'Life',
                  'Work',
                  'Medicine',
                  'Bills',
                  'Hobby',
                  'Holiday',
                ][Random().nextInt(6)]),
          ),
        ),
        settings: const ChartGroupPieSettings(),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipPieShape<ChartGroupPieDataItem>(
          onTextName: (item) => item.label,
          onTextValue: (item) => item.amount.toString(),
          radius: 10.0,
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.all(12.0),
          nameTextStyle: const TextStyle(
            color: Colors.amber,
            fontSize: 12.0,
          ),
          valueTextStyle: const TextStyle(
            color: Colors.yellowAccent,
            fontSize: 18.0,
          ),
        ),
      )
    ];
  }
}
