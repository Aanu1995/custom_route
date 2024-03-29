import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation({this.delay, this.child});

  static int duration = 500;

  final tween = MultiTrackTween([
    Track("opacity")
        .add(Duration(milliseconds: duration), Tween(begin: 0.0, end: 1.0)),
    Track("translateY").add(
        Duration(milliseconds: duration), Tween(begin: -130.0, end: 0.0),
        curve: Curves.easeOut)
  ]);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      delay: Duration(milliseconds: (duration * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
