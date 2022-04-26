part of 'chart_animation.dart';

/// Provides size animation values.
class ChartSizeAnimation implements ChartAnimation {
  Animation<Size>? _animation;
  Size _lastSize = Size.zero;

  ChartSizeAnimation();

  /// Current value during the animation.
  ///
  /// Defaults to Size.zero
  Size get current => _lastSize = _animation?.value ?? Size.zero;

  /// Last value on finish/stop animation.
  ///
  /// Defaults to Size.zero
  Size get last => _lastSize;

  /// Dispose animation.
  @override
  void dispose() {
    _animation = null;
  }

  /// Initialize animation.
  void setup({
    required AnimationController controller,
    required Size size,
    Curve curve = Curves.easeOutExpo,
    Size? initialSize,
    ChartSizeAnimation? oldAnimation,
  }) {
    final Animation<Size> animation = Tween<Size>(
      begin: oldAnimation?._lastSize ?? initialSize ?? size,
      end: size,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: curve,
      ),
    );
    _animation = animation;
  }
}
