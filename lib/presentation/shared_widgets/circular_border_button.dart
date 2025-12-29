import 'package:flutter/material.dart';
import 'package:motor/motor.dart';
import 'package:portfolio/core/theme/sizes.dart';

class CircularBorderButton extends StatefulWidget {
  final void Function()? onTap;
  final Widget child;
  final Color? color;
  final double? paddingValue;
  const CircularBorderButton({
    super.key,
    this.onTap,
    required this.child,
    this.color,
    this.paddingValue,
  });

  @override
  State<CircularBorderButton> createState() => _CircularBorderButtonState();
}

class _CircularBorderButtonState extends State<CircularBorderButton> {
  final statesController = WidgetStatesController();

  @override
  void dispose() {
    super.dispose();
    statesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: StadiumBorder(
        side: BorderSide(
          width: AppSizes.outlineWidth,
          color: widget.color ?? Theme.of(context).colorScheme.outline,
        ),
      ),
      color: Colors.transparent,
      child: ListenableBuilder(
        listenable: statesController,
        builder: (context, child) {
          return SingleMotionBuilder(
            motion: const CupertinoMotion.smooth(),
            builder: (context, value, child) {
              return Listener(
                onPointerDown: (event) {
                  statesController.update(WidgetState.pressed, true);
                },
                onPointerUp: (event) {
                  statesController.update(WidgetState.pressed, false);
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (event) {
                    statesController.update(WidgetState.hovered, true);
                  },
                  onExit: (event) {
                    statesController.update(WidgetState.hovered, false);
                  },
                  child: InkWell(
                    onTap: widget.onTap,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppSizes.circularRadius),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        value * (widget.paddingValue ?? AppSizes.p16),
                      ),
                      child: widget.child,
                    ),
                  ),
                ),
              );
            },
            value: switch (statesController.value) {
              final v when v.contains(WidgetState.pressed) => 1.1,
              final v when v.contains(WidgetState.hovered) => 1.2,
              _ => 1,
            },
          );
        },
      ),
    );
  }
}
