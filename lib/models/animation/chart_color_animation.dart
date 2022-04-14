part of 'chart_animation.dart';

class ChartColorAnimation implements ChartAnimation {
  Animation<Color?>? _animation;
  Color _lastColor = Colors.transparent;

  ChartColorAnimation();

  Color get current => _lastColor = _animation?.value ?? Colors.transparent;

  Color get last => _lastColor;

  @override
  void dispose() {
    _animation = null;
  }

  void setup({
    required Color color,
    required AnimationController controller,
    Curve curve = Curves.easeInOut,
    Color? initialColor,
    ChartColorAnimation? oldAnimation,
  }) {
    final Animation<Color?> animation = ColorTween(
      begin: oldAnimation?._lastColor ?? initialColor ?? Colors.transparent,
      end: color,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: curve,
      ),
    );
    _animation = animation;
  }
}
