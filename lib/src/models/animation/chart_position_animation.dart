part of 'chart_animation.dart';

/// Provides position animation values.
class ChartPositionAnimation implements ChartAnimation {
  Animation<Offset>? _animation;
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
  }

  /// Initialize animation.
  void setup({
    required AnimationController controller,
    required Offset position,
    Curve curve = Curves.easeOutExpo,
    Offset? initialPosition,
    ChartPositionAnimation? oldAnimation,
  }) {
    final Animation<Offset> animation = Tween<Offset>(
      begin: oldAnimation?._lastPosition ?? initialPosition ?? position,
      end: position,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: curve,
      ),
    );
    _animation = animation;
  }
}
