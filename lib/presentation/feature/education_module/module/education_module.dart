import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:web/web.dart' as web show window;

class EducationModule extends StatelessWidget {
  const EducationModule({super.key, required this.educationData});
  final EducationData educationData;

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
          spacing: AppSizes.p20,
          children: [
            Row(
              spacing: AppSizes.p20,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Education",
                  style: theme.textTheme.headlineMedium?.copyWith(height: 1),
                ),
                Icon(Icons.school, color: theme.colorScheme.primary, size: 40),
              ],
            ),
            const SizedBox(height: AppSizes.p20),
            Material(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.outline,
                  width: AppSizes.outlineWidth,
                ),
                borderRadius: BorderRadius.circular(AppSizes.p20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.p20),
                child: Column(
                  spacing: AppSizes.p10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      educationData.degreeName,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      educationData.universityName,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      "${educationData.startDate} - ${educationData.endDate}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            if (educationData.graduationProject != null) ...[
              Center(
                child: Container(
                  height: 40,
                  width: AppSizes.defaultLinkWidth,
                  color: theme.colorScheme.outline,
                ),
              ),
              Material(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: theme.colorScheme.outline,
                    width: AppSizes.outlineWidth,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.p20),
                ),
                child: InkWell(
                  onTap: () =>
                      web.window.open(educationData.graduationProject!.link!),
                  borderRadius: BorderRadius.circular(AppSizes.p20),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.p20),
                    child: Column(
                      spacing: AppSizes.p10,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          educationData.graduationProject!.title,
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          educationData.graduationProject!.description,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.outline,
                          ),
                        ),
                        Text(
                          "(Score: ${educationData.graduationProject!.score})",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
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
