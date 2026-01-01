import 'package:flutter/material.dart';
import 'package:motor/motor.dart';
import 'package:portfolio/core/theme/durations.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';

class NumericalDescriptionWidget extends StatefulWidget {
  final NumericalDescription numericalDescription;
  final int index;
  const NumericalDescriptionWidget({
    super.key,
    required this.numericalDescription,
    required this.index,
  });

  @override
  State<NumericalDescriptionWidget> createState() =>
      _NumericalDescriptionWidgetState();
}

class _NumericalDescriptionWidgetState extends State<NumericalDescriptionWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _animation;
  bool _isAnimationDone = false;
  final _stateController = WidgetStatesController();

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
      duration: AppDurations.numericalDescriptionTweenDuration,
    );
    // Create the IntTween and connect it to the controller
    _animation = IntTween(
      begin: 0,
      end: widget.numericalDescription.value,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuad));
    // Add a status listener to the controller.
    _controller.addStatusListener(_onAnimationCompleted);
    // delay the animation to start after 1 second
    Future.delayed(Duration(milliseconds: 1000 + widget.index * 250), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    // Just in case the widget is removed *before* the animation finishes
    _controller.removeStatusListener(_onAnimationCompleted);
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: AppSizes.p20,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.p8),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: AppSizes.numericalDescriptionNumberWidth,
              maxWidth: AppSizes.numericalDescriptionNumberWidth,
            ),
            child: _isAnimationDone
                ? ValueListenableBuilder(
                    valueListenable: _stateController,
                    builder: (context, _, child) {
                      return SingleMotionBuilder(
                        motion: const CupertinoMotion.smooth(),
                        builder: (context, value, child) {
                          return MouseRegion(
                            onHover: (event) => _stateController.update(
                              WidgetState.hovered,
                              true,
                            ),
                            onExit: (event) => _stateController.update(
                              WidgetState.hovered,
                              false,
                            ),
                            child: Text(
                              "${widget.numericalDescription.value}",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontSize: value,
                                color:
                                    _stateController.value.contains(
                                      WidgetState.hovered,
                                    )
                                    ? theme.colorScheme.primary
                                    : null,
                              ),
                            ),
                          );
                        },
                        value: switch (_stateController.value) {
                          final v when v.contains(WidgetState.hovered) =>
                            theme.textTheme.headlineLarge!.fontSize!,
                          _ => theme.textTheme.headlineMedium!.fontSize!,
                        },
                      );
                    },
                  )
                : AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Text(
                        "${_animation.value}",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium,
                      );
                    },
                  ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: AppSizes.numericalDescriptionTextWidth,
            maxWidth: AppSizes.numericalDescriptionTextWidth,
          ),
          child: Text(
            widget.numericalDescription.title,
            textAlign: MediaQuery.sizeOf(context).width < 475
                ? TextAlign.center
                : TextAlign.start,
            style: theme.textTheme.labelSmall?.copyWith(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
