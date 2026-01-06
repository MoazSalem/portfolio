import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:motor/motor.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';

class WorkCard extends StatefulWidget {
  const WorkCard({super.key, this.onTap, required this.workExperience});
  final WorkExperience workExperience;
  final void Function()? onTap;

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
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
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: AppSizes.workContainerMaxWidth,
                    minWidth: AppSizes.workContainerMaxWidth,
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
                        onTap: widget.onTap,
                        borderRadius: BorderRadius.circular(
                          AppSizes.borderRadius,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(AppSizes.p30),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.workExperience.position,
                                style: theme.textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                              ),
                              Text(
                                widget.workExperience.companyName,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  fontSize: AppSizes.font18,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              Text(
                                "${widget.workExperience.startDate} - ${widget.workExperience.endDate}",
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: AppSizes.p4),
                              ...List.generate(
                                widget.workExperience.responsibilities!.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppSizes.p4,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("•  "),
                                      Expanded(
                                        child: Text(
                                          widget
                                              .workExperience
                                              .responsibilities![index],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
