# Charts Flutter
Simple and beautiful smooth animated charts.
# Supported charts
## Bar
![Screenshot1](/screenshots/chart_bar.gif) 
## Group bar
![Screenshot2](/screenshots/chart_group_bar.gif)
## Candle
![Screenshot3](/screenshots/chart_candle.gif)
## Line
![Screenshot4](/screenshots/chart_line.gif)
## Pie
![Screenshot5](/screenshots/chart_pie.gif)
# Example
Check `/example` folder for more detailed usage
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
# About
Developed with passion, by Merixstudio developers. 
