import 'package:flutter/material.dart';
import 'package:portfolio/modules/independent_animations/intro_animation.dart';
import 'package:portfolio/modules/introduction/layout/introduction_module.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
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
        IntroductionModule(),
        if (_showAnimation) // to unmount the animations once it's done
          IntroAnimation(rectWidth: 180, duration: _animationDuration),
      ],
    );
  }
}
