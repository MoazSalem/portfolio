import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/feature/projects_module/widgets/project_card.dart';
import 'package:portfolio/presentation/shared_widgets/circular_border_button.dart';

class ProjectsModule extends StatefulWidget {
  const ProjectsModule({super.key, required this.projects, this.scrollKey});
  final List<Project> projects;
  final Key? scrollKey;

  @override
  State<ProjectsModule> createState() => _ProjectsModuleState();
}

class _ProjectsModuleState extends State<ProjectsModule> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.moduleInnerVerticalPadding,
          horizontal: AppSizes.moduleInnerHorizontalPadding,
        ),
        child: Column(
          key: widget.scrollKey,
          children: [
            const ProjectsHeader(),
            const SizedBox(height: AppSizes.p60),
            AnimatedSize(
              duration: const Duration(milliseconds: 600),
              alignment: Alignment.topCenter,
              curve: Curves.easeInOut,
              child: GridView.builder(
                primary: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent:
                      AppSizes.projectContainerMaxCrossAxisExtent,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: AppSizes.p16,
                  mainAxisSpacing: AppSizes.p16,
                ),
                itemCount: _isExpanded ? widget.projects.length : 3,
                itemBuilder: (context, index) {
                  return ProjectCard(project: widget.projects[index]);
                },
              ),
            ),
            if (widget.projects.length > 3) ...[
              const SizedBox(height: AppSizes.p40),
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

class ProjectsHeader extends StatelessWidget {
  const ProjectsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        text: "Some of My ",
        style: theme.textTheme.headlineSmall?.copyWith(
          height: 1,
          color: theme.colorScheme.onSurface,
        ),
        children: [
          TextSpan(
            text: "Projects",
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
