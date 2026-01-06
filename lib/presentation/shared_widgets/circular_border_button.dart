import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:motor/motor.dart';
import 'package:portfolio/core/theme/sizes.dart';

class CircularBorderButton extends StatefulWidget {
  final void Function()? onTap;
  final Widget child;
  final Color? color;
  final Color? backgroundColor;
  final double? paddingValue;
  const CircularBorderButton({
    super.key,
    this.onTap,
    required this.child,
    this.color,
    this.backgroundColor,
    this.paddingValue,
  });

  @override
  State<CircularBorderButton> createState() => _CircularBorderButtonState();
}

class _CircularBorderButtonState extends State<CircularBorderButton> {
  final _statesController = WidgetStatesController();

  @override
  void dispose() {
    super.dispose();
    _statesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListenableBuilder(
      listenable: _statesController,
      builder: (context, child) {
        return Material(
          shape: StadiumBorder(
            side: BorderSide(
              width: AppSizes.outlineWidth,
              color:
                  _statesController.value.contains(WidgetState.hovered) ||
                      _statesController.value.contains(WidgetState.pressed)
                  ? theme.colorScheme.primary
                  : widget.color ?? theme.colorScheme.outline,
            ),
          ),
          color: widget.backgroundColor ?? Colors.transparent,
          child: SingleMotionBuilder(
            motion: const CupertinoMotion.smooth(),
            builder: (context, value, child) {
              return MouseRegion(
                onHover: (hover) {
                  if (hover.kind == PointerDeviceKind.mouse) {
                    _statesController.update(WidgetState.hovered, true);
                  }
                },
                onExit: (hover) {
                  if (hover.kind == PointerDeviceKind.mouse) {
                    _statesController.update(WidgetState.hovered, false);
                  }
                },
                child: InkWell(
                  onLongPress: () =>
                      _statesController.update(WidgetState.pressed, true),
                  onLongPressUp: () =>
                      _statesController.update(WidgetState.pressed, false),
                  onTap: widget.onTap,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppSizes.circularRadius),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      value * (widget.paddingValue ?? AppSizes.p16),
                    ),
                    child: child,
                  ),
                ),
              );
            },
            value: switch (_statesController.value) {
              final v when v.contains(WidgetState.pressed) => 1.1,
              final v when v.contains(WidgetState.hovered) => 1.2,
              _ => 1,
            },
            child: widget.child,
          ),
        );
      },
    );
  }
}
