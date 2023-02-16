part of 'chart_animation.dart';

/// Provides position animation values.
class ChartPositionAnimation implements ChartAnimation {
  Animation<Offset>? _animation;
  CurvedAnimation? _listener;
  Offset _lastPosition = Offset.zero;

  ChartPositionAnimation();

  /// Current value during the animation.
  ///
  /// Defaults to Offset.zero
  Offset get current => _lastPosition = _animation?.value ?? Offset.zero;

  /// Last value on finish/stop animation.
  ///
  /// Defaults to Offset.zero
  Offset get last => _lastPosition;

  /// Dispose animation.
  @override
  void dispose() {
    _animation = null;
    _listener?.dispose();
  }

  /// Initialize animation.
  void setup({
    required AnimationController controller,
    required Offset position,
    Curve curve = Curves.easeOutExpo,
    Offset? initialPosition,
    ChartPositionAnimation? oldAnimation,
  }) {
    _listener?.dispose();
    _listener = CurvedAnimation(
      parent: controller,
      curve: curve,
    );
    _animation = Tween<Offset>(
      begin: oldAnimation?._lastPosition ?? initialPosition ?? position,
      end: position,
    ).animate(_listener!);
  }
}
