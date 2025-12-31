import 'package:flutter/material.dart';
import 'package:motor/motor.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/feature/introduction_module/widgets/external_links_wrap.dart';

class IntroductionTextColumn extends StatefulWidget {
  final IntroductionData introductionData;
  final List<ExternalLink> externalLinks;
  final double maxWidth;
  final bool isPortrait;
  const IntroductionTextColumn({
    super.key,
    required this.maxWidth,
    required this.isPortrait,
    required this.introductionData,
    required this.externalLinks,
  });

  @override
  State<IntroductionTextColumn> createState() => _IntroductionTextColumnState();
}

class _IntroductionTextColumnState extends State<IntroductionTextColumn> {
  final _stateController = WidgetStatesController();

  @override
  void deactivate() {
    super.deactivate();
    _stateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: widget.isPortrait
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // User title
        Text(
          widget.introductionData.title,
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: AppSizes.p10),
        Text('Hello I\'m', style: theme.textTheme.headlineLarge),
        // User name
        ValueListenableBuilder(
          valueListenable: _stateController,
          builder: (context, _, child) {
            return SingleMotionBuilder(
              motion: const CupertinoMotion.smooth(),
              builder: (context, value, child) {
                return MouseRegion(
                  onHover: (event) =>
                      _stateController.update(WidgetState.hovered, true),
                  onExit: (event) =>
                      _stateController.update(WidgetState.hovered, false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    color: _stateController.value.contains(WidgetState.hovered)
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                    curve: Curves.easeOut,
                    child: AnimatedPadding(
                      padding: EdgeInsets.all(value),
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        widget.introductionData.name,
                        style: theme.textTheme.headlineLarge?.copyWith(
                          color:
                              _stateController.value.contains(
                                WidgetState.hovered,
                              )
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                );
              },
              value: switch (_stateController.value) {
                final v when v.contains(WidgetState.hovered) => AppSizes.p8,
                _ => 0,
              },
            );
          },
        ),
        const SizedBox(height: AppSizes.p20),
        // User description
        ConstrainedBox(
          constraints: BoxConstraints(
            // make sure the description doesn't exceed max width and interfere with the user avatar
            maxWidth: widget.isPortrait
                ? widget.maxWidth
                : AppSizes.userDescriptionMaxWidthConstraint <
                      widget.maxWidth * 0.4
                ? AppSizes.userDescriptionMaxWidthConstraint
                : widget.maxWidth * 0.4,
          ),
          child: Text(
            maxLines: AppSizes.userDescriptionMaxLines,
            overflow: TextOverflow.ellipsis,
            widget.introductionData.description,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
        ),
        const SizedBox(height: AppSizes.p40),
        // External links buttons
        ExternalLinksWrap(externalLinks: widget.externalLinks),
      ],
    );
  }
}
