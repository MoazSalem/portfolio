import 'package:flutter/material.dart';
import 'package:portfolio/modules/independent_animations/intro_animation.dart';

class IntroductionModule extends StatefulWidget {
  const IntroductionModule({super.key});

  @override
  State<IntroductionModule> createState() => _IntroductionModuleState();
}

class _IntroductionModuleState extends State<IntroductionModule> {
  // A state variable to control visibility
  bool _showAnimation = true;

  static const _animationDuration = Duration(milliseconds: 800);

  @override
  void initState() {
    super.initState();
    // Start a timer when the widget is first built
    Future.delayed(_animationDuration, () {
      // When the timer completes, update the state to hide the animation
      if (mounted) {
        setState(() {
          _showAnimation = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Hello',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
        if (_showAnimation) // to unmount the animations once it's done
          IntroAnimation(rectWidth: 180, duration: _animationDuration),
      ],
    );
  }
}
