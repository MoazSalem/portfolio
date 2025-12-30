import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/user.dart';
import 'package:portfolio/core/theme/durations.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/presentation/feature/education_module/module/education_module.dart';
import 'package:portfolio/presentation/feature/independent_animations/intro_animation.dart';
import 'package:portfolio/presentation/feature/introduction_module/module/introduction_module.dart';
import 'package:portfolio/presentation/feature/projects_module/module/projects_module.dart';
import 'package:portfolio/presentation/shared_widgets/modules_link.dart';

import 'feature/contact_module/module/contact_module.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  late ScrollController _scrollController;
  // A state variable to control visibility
  bool _showAnimation = true;

  static const _animationDuration = AppDurations.longAnimationDuration;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
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
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // This stack is used to position animations over modules
    return CupertinoScrollbar(
      controller: _scrollController,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SelectionArea(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppSizes.moduleMaxWidth,
                  minWidth: AppSizes.moduleMinWidth,
                ),
                child: CustomScrollView(
                  controller: _scrollController,
                  scrollBehavior: const ScrollBehavior().copyWith(
                    scrollbars: false,
                  ),
                  slivers: [
                    SliverToBoxAdapter(
                      child: IntroductionModule(
                        introductionData: user.introductionData,
                        externalLinks: user.externalLinks,
                      ),
                    ),
                    const SliverToBoxAdapter(child: ModulesLink()),
                    SliverToBoxAdapter(
                      child: EducationModule(educationData: user.educationData),
                    ),
                    const SliverToBoxAdapter(child: ModulesLink()),
                    SliverLayoutBuilder(
                      builder: (context, constraints) {
                        return DecoratedSliver(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainer,
                          ),
                          sliver: SliverPadding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSizes.moduleInnerVerticalPadding,
                              horizontal: AppSizes.moduleInnerHorizontalPadding,
                            ),
                            sliver: SliverMainAxisGroup(
                              slivers: [
                                const SliverToBoxAdapter(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ProjectsHeader(),
                                      SizedBox(height: AppSizes.p60),
                                    ],
                                  ),
                                ),
                                ProjectsSliverGrid(projects: user.projects),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SliverToBoxAdapter(child: ModulesLink()),
                    SliverToBoxAdapter(
                      child: ContactModule(
                        email: user.email,
                        externalLinks: user.externalLinks.reversed.toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_showAnimation) // to unmount the animations once it's done
              const IntroAnimation(
                rectWidth: AppSizes.introAnimationRectWidth,
                duration: _animationDuration,
              ),
          ],
        ),
      ),
    );
  }
}
