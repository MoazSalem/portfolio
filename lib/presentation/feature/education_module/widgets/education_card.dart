import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';

class EducationCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: AppSizes.userDescriptionMaxWidthConstraint,
        minWidth: AppSizes.userDescriptionMaxWidthConstraint,
      ),
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
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              spacing: AppSizes.p10,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  firstText,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  secondText,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                Text(thirdText, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
