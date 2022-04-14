# Charts Flutter
Simple and beautiful smooth animation charts.

# About
The main goal was to create beautiful smooth own charts.

We created all charts, animations using components provided by Flutter or even layers of canvas.

By making the project public, we can also show you how we work at Merixstudio, library uses the standard developed by our developers.

# Features
- Smooth, beautiful animations,
- Chart bar, pie, line and more...

# Screenshots
![Screenshot1](/screenshots/chart_bar.gif) 
![Screenshot2](/screenshots/chart_group_bar.gif)
![Screenshot3](/screenshots/chart_candle.gif)
![Screenshot4](/screenshots/chart_line.gif)
![Screenshot5](/screenshots/chart_pie.gif)
# Examples
Simple example for chart bar:
```dart
Chart(
  layers: [
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
    ]
  ],
)
```

# License