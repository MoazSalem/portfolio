import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/durations.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/feature/introduction_module/widgets/introduction_text_column.dart';

class InfoLayout extends StatefulWidget {
  final IntroductionData introductionData;
  final List<ExternalLink> externalLinks;
  final double maxWidth;
  const InfoLayout({
    super.key,
    required this.maxWidth,
    required this.introductionData,
    required this.externalLinks,
  });

  @override
  State<InfoLayout> createState() => _InfoLayoutState();
}

class _InfoLayoutState extends State<InfoLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimationDone = false;
  // bool to switch to vertical layout widgets
  bool isPortrait = false;

  // Define the listener function
  void _onAnimationCompleted(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        _isAnimationDone = true;
      });
      // Remove the listener so this never fires again
      _controller.removeStatusListener(_onAnimationCompleted);
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize the controller
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.defaultAnimationDuration,
    );
    // Create the Tween and connect it to the controller
    _animation = Tween<double>(
      begin: 800,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    // Add a status listener to the controller.
    _controller.addStatusListener(_onAnimationCompleted);
    _controller.forward();
  }

  @override
  void dispose() {
    // If the controller is still active when the widget is removed,
    // we should still dispose it to prevent memory leaks.
    _controller.removeStatusListener(_onAnimationCompleted);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isPortrait =
        MediaQuery.of(context).size.width < AppSizes.portraitBreakpoint;
  }

  @override
  Widget build(BuildContext context) {
    // Build the list of widgets first to have the ability to reverse it.
    final List<Widget> widgets = [
      // User avatar
      if (_isAnimationDone)
        CircleAvatar(
          radius: isPortrait
              ? AppSizes.userAvatarRadiusSmall
              : AppSizes.userAvatarRadiusBig,
          backgroundImage: NetworkImage(widget.introductionData.avatarUrl),
        ),
      // animation builder, will be removed after the animation is done
      if (!_isAnimationDone)
        AnimatedBuilder(
          animation: _animation,
          child: CircleAvatar(
            radius: isPortrait
                ? AppSizes.userAvatarRadiusSmall
                : AppSizes.userAvatarRadiusBig,
            backgroundImage: NetworkImage(widget.introductionData.avatarUrl),
          ),
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_animation.value, 0),
              child: child,
            );
          },
        ),
      if (_isAnimationDone)
        IntroductionTextColumn(
          introductionData: widget.introductionData,
          externalLinks: widget.externalLinks,
          maxWidth: widget.maxWidth,
          isPortrait: isPortrait,
        ),
      // animation builder, will be removed after the animation is done
      if (!_isAnimationDone)
        AnimatedBuilder(
          animation: _animation,
          child: IntroductionTextColumn(
            introductionData: widget.introductionData,
            externalLinks: widget.externalLinks,
            maxWidth: widget.maxWidth,
            isPortrait: isPortrait,
          ),
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(-_animation.value, 0),
              child: child,
            );
          },
        ),
    ];
    // for readability
    final orderedWidgets = isPortrait ? widgets : widgets.reversed.toList();
    return Flex(
      direction: isPortrait ? Axis.vertical : Axis.horizontal,
      spacing: AppSizes.p60,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: orderedWidgets,
    );
  }
}
