import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/feature/projects_module/widgets/project_card.dart';

class ProjectsHeader extends StatelessWidget {
  const ProjectsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        text: "Some of My ",
        style: theme.textTheme.titleLarge?.copyWith(height: 1),
        children: [
          TextSpan(
            text: "Projects",
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsSliverGrid extends StatelessWidget {
  const ProjectsSliverGrid({super.key, required this.projects});
  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppSizes.projectContainerMaxCrossAxisExtent,
        childAspectRatio: 0.9,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final project = projects[index];
        return ProjectCard(project: project);
      }, childCount: projects.length),
    );
  }
}
