part of 'chart_animation.dart';

/// Provides text style animation values.
class ChartTextStyleAnimation implements ChartAnimation {
  Animation<TextStyle>? _animation;
  CurvedAnimation? _listener;

  TextStyle _lastTextStyle = const TextStyle(
    color: Colors.transparent,
  );

  ChartTextStyleAnimation();

  /// Current value during the animation.
  ///
  /// Defaults to TextStyle(color: Colors.transparent)
  TextStyle get current => _lastTextStyle = _animation?.value ??
      const TextStyle(
        color: Colors.transparent,
      );

  /// Last value on finish/stop animation.
  ///
  /// Defaults to TextStyle(color: Colors.transparent)
  TextStyle get last => _lastTextStyle;

  /// Dispose animation.
  @override
  void dispose() {
    _animation = null;
    _listener?.dispose();
  }

  /// Initialize animation.
  void setup({
    required AnimationController controller,
    required TextStyle textStyle,
    Curve curve = Curves.easeOutExpo,
    TextStyle? initialTextSyle,
    ChartTextStyleAnimation? oldAnimation,
  }) {
    _listener?.dispose();
    _listener = CurvedAnimation(
      parent: controller,
      curve: curve,
    );
    _animation = TextStyleTween(
      begin: oldAnimation?._lastTextStyle ??
          initialTextSyle ??
          const TextStyle(
            color: Colors.transparent,
          ),
      end: textStyle,
    ).animate(_listener!);
  }
}
