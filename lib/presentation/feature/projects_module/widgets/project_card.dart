import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:motor/motor.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/core/utils/assets.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/shared_widgets/circular_border_button.dart';
import 'package:portfolio/presentation/shared_widgets/svg_asset.dart';
import 'package:web/web.dart' as web show window;

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final _statesController = WidgetStatesController();
  bool _expand = false;

  @override
  void dispose() {
    super.dispose();
    _statesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: _statesController,
      builder: (context, _, child) {
        _expand =
            _statesController.value.contains(WidgetState.hovered) ||
            _statesController.value.contains(WidgetState.pressed);
        // set the color based on the hover state
        final Color color = _expand
            ? theme.colorScheme.onPrimaryFixed
            : theme.colorScheme.surface;
        return SingleMotionBuilder(
          motion: const CupertinoMotion.smooth(),
          builder: (context, value, child) {
            return Padding(
              padding: EdgeInsets.all(value),
              child: MouseRegion(
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
                  onTap: () =>
                      _statesController.update(WidgetState.pressed, !_expand),
                  child: Material(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        // background photo
                        if (widget.project.imgsUrl != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppSizes.borderRadius,
                            ),
                            child: Image.network(
                              widget.project.imgsUrl![0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (widget.project.assetsLocation != null &&
                            widget.project.imgsUrl == null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppSizes.borderRadius,
                            ),
                            child: Center(
                              child: Image(
                                alignment: Alignment.topCenter,
                                width:
                                    AppSizes.projectContainerMaxCrossAxisExtent,
                                height:
                                    AppSizes.projectContainerMaxCrossAxisExtent,
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  widget.project.assetsLocation![0],
                                ),
                              ),
                            ),
                          ),
                        // animated background gradient
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(AppSizes.borderRadius - 2),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                color.withAlpha(255),
                                color.withAlpha(200),
                                color.withAlpha(180),
                                color.withAlpha(120),
                                color.withAlpha(0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppSizes.p16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // external links wrap
                              if (widget.project.externalLinks != null) ...[
                                Wrap(
                                  spacing: AppSizes.p8,
                                  runSpacing: AppSizes.p8,
                                  children: List.generate(
                                    widget.project.externalLinks!.length,
                                    (i) => CircularBorderButton(
                                      onTap: () => web.window.open(
                                        widget.project.externalLinks![i].url,
                                      ),
                                      paddingValue: AppSizes.p8,
                                      color: theme.colorScheme.primary,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        spacing: AppSizes.p4,
                                        children: [
                                          if (widget
                                                  .project
                                                  .externalLinks![i]
                                                  .iconAssetName !=
                                              null)
                                            SvgAsset(
                                              iconSize: AppSizes.iconSizeSmall,
                                              assetName: AppAssets.getSvgByName(
                                                widget
                                                    .project
                                                    .externalLinks![i]
                                                    .name,
                                              ),
                                              color: theme.colorScheme.primary,
                                            ),
                                          Text(
                                            widget
                                                    .project
                                                    .externalLinks![i]
                                                    .displayName ??
                                                widget
                                                    .project
                                                    .externalLinks![i]
                                                    .name
                                                    .toUpperCase(),
                                            style: theme.textTheme.displaySmall
                                                ?.copyWith(
                                                  color:
                                                      theme.colorScheme.primary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: AppSizes.p8),
                              ],

                              Text(
                                widget.project.name,
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                widget.project.description ?? '',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: Colors.white70,
                                ),
                                maxLines: _expand ? 10 : 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: AppSizes.p16),
                              if (widget.project.tags != null)
                                Wrap(
                                  spacing: AppSizes.p8,
                                  runSpacing: AppSizes.p8,
                                  children: List.generate(
                                    widget.project.tags!.length,
                                    (i) => CircularBorderButton(
                                      paddingValue: AppSizes.p8,
                                      color: theme.colorScheme.outline,
                                      child: Text(
                                        widget.project.tags![i],
                                        style: theme.textTheme.displaySmall
                                            ?.copyWith(
                                              color:
                                                  theme.colorScheme.onSurface,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          value: switch (_statesController.value) {
            final v when v.contains(WidgetState.pressed) => AppSizes.p4,
            final v when v.contains(WidgetState.hovered) => AppSizes.p2,
            _ => AppSizes.p8,
          },
        );
      },
    );
  }
}
