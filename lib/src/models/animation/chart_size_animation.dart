part of 'chart_animation.dart';

class ChartSizeAnimation implements ChartAnimation {
  Animation<Size>? _animation;
  Size _lastSize = Size.zero;

  ChartSizeAnimation();

  Size get current => _lastSize = _animation?.value ?? Size.zero;

  Size get last => _lastSize;

  @override
  void dispose() {
    _animation = null;
  }

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
