import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';

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
    final theme = Theme.of(context);
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppSizes.projectContainerMaxCrossAxisExtent,
        childAspectRatio: 0.9,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final project = projects[index];
          return Padding(
            padding: const EdgeInsets.all(AppSizes.p8),
            child: Material(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(AppSizes.borderRadius),
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  AppSizes.borderRadius,
                ),
                onTap: () {},
                onHover: (hover) {},
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    if (project.imgsUrl != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppSizes.borderRadius,
                        ),
                        child: Image.network(
                          project.imgsUrl![0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (project.assetsLocation != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppSizes.borderRadius,
                        ),
                        child: Center(
                          child: Image(
                            alignment: Alignment.topCenter,
                            width: AppSizes
                                .projectContainerMaxCrossAxisExtent,
                            fit: BoxFit.cover,
                            image: AssetImage(project.assetsLocation![0]),
                          ),
                        ),
                      ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppSizes.borderRadius - 2),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 0, 0, 0),
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(120, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0),
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
                          Text(
                            project.name,
                            style: theme.textTheme.titleMedium,
                          ),
                          Text(
                            project.description ?? '',
                            style: theme.textTheme.labelSmall,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppSizes.p16),
                          if (project.tags != null)
                            Wrap(
                              spacing: AppSizes.p8,
                              runSpacing: AppSizes.p8,
                              children: List.generate(
                                project.tags!.length,
                                (i) => Chip(
                                  label: Text(
                                    project.tags![i],
                                    style: theme.textTheme.displaySmall
                                        ?.copyWith(
                                          color: theme
                                              .colorScheme
                                              .onPrimaryContainer,
                                        ),
                                  ),
                                  shape: const StadiumBorder(),
                                  backgroundColor:
                                      theme.colorScheme.primaryContainer,
                                  side: BorderSide.none,
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
          );
        },
        childCount: projects.length,
      ),
    );
  }
}
