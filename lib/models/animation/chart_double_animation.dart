part of 'chart_animation.dart';

class ChartDoubleAnimation implements ChartAnimation {
  Animation<double>? _animation;
  double _lastValue = 0.0;

  ChartDoubleAnimation();

  double get current => _lastValue = _animation?.value ?? 0.0;

  double get last => _lastValue;

  @override
  void dispose() {
    _animation = null;
  }

  void setup({
    required AnimationController controller,
    required double value,
    Curve curve = Curves.easeOutExpo,
    double? initialValue,
    ChartDoubleAnimation? oldAnimation,
  }) {
    final Animation<double> animation = Tween<double>(
      begin: oldAnimation?._lastValue ?? initialValue ?? value,
      end: value,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: curve,
      ),
    );
    _animation = animation;
  }
}
