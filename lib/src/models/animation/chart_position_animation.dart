part of 'chart_animation.dart';

class ChartPositionAnimation implements ChartAnimation {
  Animation<Offset>? _animation;
  Offset _lastPosition = Offset.zero;

  ChartPositionAnimation();

  Offset get current => _lastPosition = _animation?.value ?? Offset.zero;

  Offset get last => _lastPosition;

  @override
  void dispose() {
    _animation = null;
  }

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
