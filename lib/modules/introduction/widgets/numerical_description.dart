import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/durations.dart';
import 'package:portfolio/core/constants/sizes.dart';
import 'package:portfolio/core/models/user.dart';

class NumericalDescriptionWidget extends StatefulWidget {
  final NumericalDescription numericalDescription;
  final double numTextSize;
  const NumericalDescriptionWidget({
    super.key,
    required this.numericalDescription,
    required this.numTextSize,
  });

  @override
  State<NumericalDescriptionWidget> createState() =>
      _NumericalDescriptionWidgetState();
}

class _NumericalDescriptionWidgetState extends State<NumericalDescriptionWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _animation;

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
    _controller.addStatusListener((status) {
      // Check if the animation has stopped at the beginning.
      if (status == AnimationStatus.dismissed) {
        // Dispose the controller.
        _controller.dispose();
      }
    });
    // delay the animation to start after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    // If the controller is still active when the widget is removed,
    // we should still dispose it to prevent memory leaks.
    if (_controller.isAnimating ||
        _controller.status != AnimationStatus.dismissed) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizes.padding20,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: AppSizes.numericalDescriptionWidgetMinWidth,
            maxWidth: AppSizes.numericalDescriptionWidgetMaxWidth,
          ),
          child: Text(
            widget.numericalDescription.title,
            style: TextStyle(
              height: AppSizes.textHeight,
              fontSize: AppSizes.font16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 80),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.padding8),
                child: Text(
                  "${_animation.value}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: AppSizes.textHeight,
                    fontSize: widget.numTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
