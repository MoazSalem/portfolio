import 'package:flutter/material.dart';
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      spacing: AppSizes.p20,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.p8),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: AppSizes.numericalDescriptionNumberWidth,
              maxWidth: AppSizes.numericalDescriptionNumberWidth,
            ),
            child: _isAnimationDone
                ? Text(
                    "${widget.numericalDescription.value}",
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium,
                  )
                : AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Text(
                        "${_animation.value}",
                        textAlign: TextAlign.center,
                        style: textTheme.headlineMedium,
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
            textAlign: TextAlign.start,
            style: textTheme.labelSmall?.copyWith(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
