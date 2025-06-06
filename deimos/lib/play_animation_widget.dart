import 'package:simple_animations/simple_animations.dart';
import 'package:flutter/material.dart';

class PlayAnimationWidget extends StatelessWidget{
  final double delay;
  final Widget child;

  const PlayAnimationWidget(
    {super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
    ..tween('opacity', Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 500))
        .thenTween('y', Tween(begin: 130.0,end: 0.0),
            duration:const Duration(milliseconds: 500),
            curve: Curves.easeOut);
    return PlayAnimationBuilder<Movie>(
      delay: Duration(microseconds: (500*delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: value.get("opacity"),
        child: Transform.translate(
          offset: Offset(0, value.get("y")), child: child),
        ),
      );
   }
}

