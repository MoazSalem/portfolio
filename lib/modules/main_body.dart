import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/durations.dart';
import 'package:portfolio/core/constants/sizes.dart';
import 'package:portfolio/core/constants/user.dart';
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

  static const _animationDuration = AppDurations.introAnimationDuration;

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
    // This stack is used to position animations over modules
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        Center(
          // Center the modules sizes
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: AppSizes.moduleMaxWidth,
              minWidth: AppSizes.moduleMinWidth,
              minHeight: AppSizes.moduleMinHeight,
            ),
            child: ColoredBox(
              color: Theme.of(context).colorScheme.surfaceContainer,
              // ListView to allow scrolling between modules, should be a builder variant later on
              child: ListView(
                children: [
                  IntroductionModule(
                    introductionData: user.introductionData,
                    externalLinks: user.externalLinks,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_showAnimation) // to unmount the animations once it's done
          IntroAnimation(
            rectWidth: AppSizes.introAnimationRectWidth,
            duration: _animationDuration,
          ),
      ],
    );
  }
}
