part of 'chart_animation.dart';

/// Provides color animation values.
class ChartColorAnimation implements ChartAnimation {
  Animation<Color?>? _animation;
  Color _lastColor = Colors.transparent;

  ChartColorAnimation();

  /// Current value during the animation.
  ///
  /// Defaults to Colors.transparent
  Color get current => _lastColor = _animation?.value ?? Colors.transparent;

  /// Last value on finish/stop animation.
  ///
  /// Defaults to Colors.transparent
  Color get last => _lastColor;

  /// Dispose animation.
  @override
  void dispose() {
    _animation = null;
  }

  /// Initialize animation.
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
