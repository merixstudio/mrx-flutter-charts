import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mrx_charts/chart.dart';
import 'package:mrx_charts/models/axis/chart_axis_layer.dart';
import 'package:mrx_charts/models/chart_layer.dart';
import 'package:mrx_charts/models/group/bar/chart_group_bar_layer.dart';
import 'package:mrx_charts/models/tooltip/chart_tooltip_layer.dart';
import 'package:mrx_charts/models/tooltip/shape/chart_tooltip_shape.dart';

class GroupBarPage extends StatefulWidget {
  const GroupBarPage({Key? key}) : super(key: key);

  @override
  State<GroupBarPage> createState() => _GroupBarPageState();
}

class _GroupBarPageState extends State<GroupBarPage> {
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
        title: const Text('Group bar'),
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
}
