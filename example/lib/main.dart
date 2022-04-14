import 'package:chart/chart.dart';
import 'package:chart/models/chart_layer.dart';
import 'package:example/mocks/chart_mocks.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final items = [
      ChartMocks.exampleCandle(),
      ChartMocks.exampleGroupPie(),
      ChartMocks.exampleGroupBar(),
      ChartMocks.exampleBar(),
      ChartMocks.exampleLine(),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFF1B0E41),
      body: ListView.separated(
        itemBuilder: (_, index) => Center(
          child: _buildChart(items[index]),
        ),
        separatorBuilder: (_, __) => const SizedBox(
          height: 24.0,
        ),
        itemCount: items.length,
      ),
    );
  }

  Widget _buildChart(List<ChartLayer> layers) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 400.0,
      child: Chart(
        layers: layers,
        padding: const EdgeInsets.symmetric(horizontal: 48.0).copyWith(
          bottom: 12.0,
        ),
      ),
    );
  }
}
