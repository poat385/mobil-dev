import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class PlayAnimationWidget extends StatelessWidget {
  final double delay;
  final Widget child;

  const PlayAnimationWidget(
      {super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('opacity', Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 500))
          .thenTween('y', Tween<double>(begin: 130, end: 0.0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut);
    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: value.get("opacity"),
        child: Transform.translate(
          offset: Offset(0, value.get<double>("y")),
          child: child,
        ),
      ),
    );
  }
}
