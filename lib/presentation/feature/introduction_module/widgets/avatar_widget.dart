import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:motor/motor.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/presentation/feature/introduction_module/widgets/orbiting_expanding_border.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({
    super.key,
    required this.isPortrait,
    required this.avatarUrl,
  });

  final bool isPortrait;
  final String avatarUrl;

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget>
    with SingleTickerProviderStateMixin {
  final _statesController = WidgetStatesController();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Speed of rotation
    )..repeat(); // Keep it looping
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage(widget.avatarUrl), context);
  }

  @override
  void dispose() {
    _controller.dispose();
    _statesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final diameter = widget.isPortrait
        ? AppSizes.userAvatarRadiusSmall * 2
        : AppSizes.userAvatarRadiusBig * 2;
    return ListenableBuilder(
      listenable: _statesController,
      child: ClipOval(
        child: Image.asset(
          widget.avatarUrl,
          width: diameter,
          height: diameter,
          fit: BoxFit.cover,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) {
              return child;
            }
            return AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              child: child,
            );
          },
        ),
      ),
      builder: (context, child) {
        return SingleMotionBuilder(
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
              child: GestureDetector(
                onTap: () => _statesController.update(
                  WidgetState.hovered,
                  !_statesController.value.contains(WidgetState.hovered),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Ensures the shadow is circular
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.primary.withAlpha(
                          (value * 60).toInt(),
                        ), // Shadow color
                        blurRadius: value * 20,
                        spreadRadius: value * 16,
                      ),
                    ],
                  ),
                  // border animation
                  child: OrbitingExpandingBorder(
                    color: theme.colorScheme.primary,
                    radius: widget.isPortrait
                        ? AppSizes.userAvatarRadiusSmall
                        : AppSizes.userAvatarRadiusBig,
                    speed: Duration(
                      seconds:
                          _statesController.value.contains(WidgetState.hovered)
                          ? 5
                          : 10,
                    ),
                    lineWidth: value * 5,
                    child: child,
                  ),
                ),
              ),
            );
          },

          value: switch (_statesController.value) {
            final v when v.contains(WidgetState.pressed) => 1.2,
            final v when v.contains(WidgetState.hovered) => 1.4,
            _ => 1,
          },
          child: child,
        );
      },
    );
  }
}
