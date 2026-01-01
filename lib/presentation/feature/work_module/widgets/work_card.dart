import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({super.key, this.onTap, required this.workExperience});
  final WorkExperience workExperience;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000, minWidth: 1000),
      child: Material(
        color: theme.colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: theme.colorScheme.outline,
            width: AppSizes.outlineWidth,
          ),
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.p24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workExperience.position,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                Text(
                  workExperience.companyName,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: AppSizes.font18,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Text(
                  "${workExperience.startDate} - ${workExperience.endDate}",
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: AppSizes.p4),
                ...List.generate(
                  workExperience.responsibilities!.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.p4,
                      vertical: AppSizes.p4,
                    ),
                    child: Text(
                      "•  ${workExperience.responsibilities![index]}",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
