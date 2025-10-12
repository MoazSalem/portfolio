import 'package:flutter/material.dart';

class IntroAnimation extends StatelessWidget {
  final Color? color;
  final Duration duration;
  final double rectWidth;

  const IntroAnimation({
    super.key,
    this.color,
    required this.duration,
    required this.rectWidth,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // get screen orientation
    bool isPortrait = size.width < size.height;
    // calculate number of rectangles
    int numOfRects = (isPortrait ? size.height : size.width) ~/ rectWidth;
    // calculate tween end value
    double end = isPortrait ? size.height : size.width;
    //
    final color = this.color ?? Theme.of(context).colorScheme.primary;
    // Use flex to change direction depending on the screen orientation
    return Flex(
      direction: isPortrait ? Axis.vertical : Axis.horizontal,
      // build the animated rectangles with tween animation builder
      children: List.generate(
        numOfRects,
        (i) => Expanded(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: i.isEven ? end : -end),
            duration: duration,
            builder: (context, tween, child) {
              return Transform.translate(
                offset: Offset(isPortrait ? tween : 0, isPortrait ? 0 : tween),
                child: child,
              );
            },
            child: Container(color: color),
          ),
        ),
      ),
    );
  }
}
