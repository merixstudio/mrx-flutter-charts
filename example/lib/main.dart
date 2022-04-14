import 'package:example/pages/bar_page.dart';
import 'package:example/pages/candle_page.dart';
import 'package:example/pages/group_bar_page.dart';
import 'package:example/pages/line_page.dart';
import 'package:example/pages/pie_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const BarPage(),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF1B0E41),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Bar'),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const GroupBarPage(),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF1B0E41),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Group bar'),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CandlePage(),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF1B0E41),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Candle'),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const LinePage(),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF1B0E41),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Line'),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const PiePage(),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF1B0E41),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Pie'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
