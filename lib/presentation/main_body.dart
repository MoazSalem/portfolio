import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/user.dart';
import 'package:portfolio/core/theme/durations.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/presentation/feature/education_module/module/education_module.dart';
import 'package:portfolio/presentation/feature/independent_animations/intro_animation.dart';
import 'package:portfolio/presentation/feature/introduction_module/module/introduction_module.dart';
import 'package:portfolio/presentation/shared_widgets/modules_link.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  // A state variable to control visibility
  bool _showAnimation = true;

  static const _animationDuration = AppDurations.longAnimationDuration;

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
        ListView(
          children: [
            // To make any text selectable.
            SelectionArea(
              child: Center(
                // Center the modules sizes
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: AppSizes.moduleMaxWidth,
                    minWidth: AppSizes.moduleMinWidth,
                    minHeight: AppSizes.moduleMinHeight,
                  ),
                  child: Column(
                    children: [
                      IntroductionModule(
                        introductionData: user.introductionData,
                        externalLinks: user.externalLinks,
                      ),
                      const ModulesLink(),
                      const EducationModule(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_showAnimation) // to unmount the animations once it's done
          const IntroAnimation(
            rectWidth: AppSizes.introAnimationRectWidth,
            duration: _animationDuration,
          ),
      ],
    );
  }
}
