import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/feature/work_module/widgets/work_card.dart';
import 'package:portfolio/presentation/shared_widgets/circular_border_button.dart';

class WorkModule extends StatefulWidget {
  const WorkModule({super.key, required this.workExperiences});
  final List<WorkExperience> workExperiences;

  @override
  State<WorkModule> createState() => _WorkModuleState();
}

class _WorkModuleState extends State<WorkModule>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.moduleInnerVerticalPadding,
          horizontal: AppSizes.moduleInnerHorizontalPadding,
        ),
        child: Column(
          spacing: AppSizes.p20,
          children: [
            FittedBox(
              child: Row(
                spacing: AppSizes.p20,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Work Experience",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      height: 1,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  Icon(
                    Icons.work,
                    color: theme.colorScheme.primary,
                    size: AppSizes.iconSizeXLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.p20),
            Column(
              children: [
                ...List.generate(
                  widget.workExperiences.length < 3
                      ? widget.workExperiences.length
                      : 3,
                  (index) {
                    return WorkCard(
                      workExperience: widget.workExperiences[index],
                    );
                  },
                ),
                if (widget.workExperiences.length > 3)
                  AnimatedSize(
                    duration: const Duration(milliseconds: 600),
                    alignment: Alignment.topCenter,
                    curve: Curves.easeInOut,
                    child: _isExpanded
                        ? Column(
                            children: List.generate(
                              widget.workExperiences.length - 3,
                              (index) {
                                return WorkCard(
                                  workExperience:
                                      widget.workExperiences[index + 3],
                                );
                              },
                            ),
                          )
                        : const SizedBox(width: double.infinity),
                  ),
              ],
            ),
            if (widget.workExperiences.length > 3) ...[
              const SizedBox(height: AppSizes.p10),
              CircularBorderButton(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                paddingValue: AppSizes.p8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.p8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: AppSizes.p4,
                    children: [
                      Text(
                        "See ${_isExpanded ? "Less" : "More"}",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Icon(
                        _isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                        size: AppSizes.iconSizeSmall,
                        color: theme.colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
