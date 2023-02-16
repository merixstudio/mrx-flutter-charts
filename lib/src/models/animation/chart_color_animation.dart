part of 'chart_animation.dart';

/// Provides color animation values.
class ChartColorAnimation implements ChartAnimation {
  Animation<Color?>? _animation;
  CurvedAnimation? _listener;

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
    _listener?.dispose();
  }

  /// Initialize animation.
  void setup({
    required Color color,
    required AnimationController controller,
    Curve curve = Curves.easeInOut,
    Color? initialColor,
    ChartColorAnimation? oldAnimation,
  }) {
    _listener?.dispose();
    _listener = CurvedAnimation(
      parent: controller,
      curve: curve,
    );
    _animation = ColorTween(
      begin: oldAnimation?._lastColor ?? initialColor ?? Colors.transparent,
      end: color,
    ).animate(_listener!);
  }
}
