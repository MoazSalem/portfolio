import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/user.dart';
import 'package:portfolio/core/theme/durations.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/presentation/feature/education_module/module/education_module.dart';
import 'package:portfolio/presentation/feature/independent_animations/intro_animation.dart';
import 'package:portfolio/presentation/feature/introduction_module/module/introduction_module.dart';
import 'package:portfolio/presentation/feature/projects_module/module/projects_module.dart';
import 'package:portfolio/presentation/shared_widgets/circular_border_button.dart';
import 'package:portfolio/presentation/shared_widgets/modules_link.dart';
import 'package:scroll_animator/scroll_animator.dart';

import 'feature/contact_module/module/contact_module.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  // A state variable to control visibility
  bool _showAnimation = true;
  bool _showNavbar = true;

  // for the navbar
  final List<String> _modules = ["About", "Education", "Projects", "Contact"];
  late final List<GlobalKey> _keys = List.generate(
    _modules.length,
    (index) => GlobalKey(),
  );

  static const _animationDuration = AppDurations.longAnimationDuration;

  void _scrollToModule(GlobalKey key, ScrollController controller) {
    final context = key.currentContext;
    if (context == null) return;

    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return;

    final scrollController = controller;
    final offset = scrollController.offset;
    final boxY = box.localToGlobal(Offset.zero).dy;

    // Calculate target offset: currentScrollOffset + (boxPosition - topPadding)
    // We assume the app bar is pinned and takes ~kToolbarHeight space.
    // boxY is the position on screen. We want it to be at kToolbarHeight.
    const targetY = kToolbarHeight;
    final delta = boxY - targetY;
    final targetOffset = (offset + delta).clamp(
      0.0,
      scrollController.position.maxScrollExtent,
    );

    scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _showNavbar = MediaQuery.sizeOf(context).width > 600;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // this allows for the smooth scrolling with the mouse
    return AnimatedPrimaryScrollController(
      animationFactory: const ChromiumEaseInOut(),
      child: Builder(
        builder: (context) {
          final scrollController = PrimaryScrollController.of(context);
          return CupertinoScrollbar(
            controller: scrollController,
            child: Center(
              // This stack is used to position the starting animation over modules and the navbar
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
                        controller: scrollController,
                        scrollBehavior: const ScrollBehavior().copyWith(
                          scrollbars: false,
                        ),
                        physics: const ClampingScrollPhysics(),
                        slivers: [
                          SliverToBoxAdapter(
                            child: IntroductionModule(
                              key: _keys[0],
                              introductionData: user.introductionData,
                              externalLinks: user.externalLinks,
                            ),
                          ),
                          const SliverToBoxAdapter(child: ModulesLink()),
                          SliverToBoxAdapter(
                            child: EducationModule(
                              key: _keys[1],
                              educationData: user.educationData,
                            ),
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
                                    vertical:
                                        AppSizes.moduleInnerVerticalPadding,
                                    horizontal:
                                        AppSizes.moduleInnerHorizontalPadding,
                                  ),
                                  sliver: SliverMainAxisGroup(
                                    slivers: [
                                      SliverToBoxAdapter(
                                        child: Column(
                                          key: _keys[2],
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const ProjectsHeader(),
                                            const SizedBox(
                                              height: AppSizes.p60,
                                            ),
                                          ],
                                        ),
                                      ),
                                      ProjectsSliverGrid(
                                        projects: user.projects,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SliverToBoxAdapter(child: ModulesLink()),
                          SliverToBoxAdapter(
                            child: ContactModule(
                              key: _keys[3],
                              email: user.email,
                              externalLinks: user.externalLinks.reversed
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Navbar
                  Positioned(
                    top: AppSizes.p16,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeOutCubic,
                      child: _showNavbar
                          ? Card(
                              color: theme.colorScheme.surfaceContainer
                                  .withAlpha(160),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: theme.colorScheme.outline,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppSizes.borderRadius,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(AppSizes.p8),
                                child: Row(
                                  spacing: AppSizes.p8,
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                    _modules.length,
                                    (index) => CircularBorderButton(
                                      color: Colors.transparent,
                                      paddingValue: AppSizes.p8,
                                      onTap: () => _scrollToModule(
                                        _keys[index],
                                        scrollController,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: AppSizes.p8,
                                        ),
                                        child: Text(
                                          _modules[index],
                                          style: theme.textTheme.labelSmall,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  // Hamburger menu button
                  Positioned(
                    top: AppSizes.p24,
                    right: AppSizes.p24,
                    child: CircularBorderButton(
                      color: theme.colorScheme.outline,
                      backgroundColor: theme.colorScheme.surfaceContainer
                          .withAlpha(180),
                      paddingValue: AppSizes.p12,
                      onTap: () => setState(() {
                        _showNavbar = !_showNavbar;
                      }),
                      child: Icon(
                        Icons.menu,
                        color: theme.colorScheme.onSurface,
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
        },
      ),
    );
  }
}
