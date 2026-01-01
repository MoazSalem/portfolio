import 'package:flutter/material.dart';
import 'package:motor/motor.dart';
import 'package:portfolio/core/theme/sizes.dart';

class EducationCard extends StatefulWidget {
  const EducationCard({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.thirdText,
    this.onTap,
  });
  final String firstText;
  final String secondText;
  final String thirdText;
  final void Function()? onTap;

  @override
  State<EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard> {
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
        return SingleMotionBuilder(
          motion: const CupertinoMotion.smooth(),
          builder: (context, value, child) {
            final bool isHovered = _statesController.value.contains(
              WidgetState.hovered,
            );
            return MouseRegion(
              onHover: (hover) {
                _statesController.update(WidgetState.hovered, true);
              },
              onExit: (hover) {
                _statesController.update(WidgetState.hovered, false);
              },
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppSizes.educationContainerMaxWidth,
                  minWidth: AppSizes.educationContainerMaxWidth,
                ),
                child: Padding(
                  padding: EdgeInsets.all(value),
                  child: Material(
                    color: isHovered
                        ? theme.colorScheme.primaryContainer
                        : theme.colorScheme.surfaceContainerHighest,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: isHovered
                            ? theme.colorScheme.primary
                            : theme.colorScheme.outline,
                        width: AppSizes.outlineWidth,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppSizes.borderRadius,
                      ),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                        AppSizes.borderRadius,
                      ),
                      onTap: widget.onTap,
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.p30),
                        child: Column(
                          spacing: AppSizes.p4,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.firstText,
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.secondText,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            Text(
                              widget.thirdText,
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          value: switch (_statesController.value) {
            final v when v.contains(WidgetState.pressed) => AppSizes.p2,
            final v when v.contains(WidgetState.hovered) => AppSizes.p4,
            _ => AppSizes.p8,
          },
        );
      },
    );
  }
}
