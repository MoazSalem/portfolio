import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/feature/introduction_module/widgets/external_links_wrap.dart';

class IntroductionTextColumn extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isPortrait
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // User title
        Text(introductionData.title, style: theme.textTheme.headlineSmall),
        const SizedBox(height: AppSizes.p10),
        Text('Hello I\'m', style: theme.textTheme.headlineLarge),
        // User name
        Text(
          introductionData.name,
          style: theme.textTheme.headlineLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: AppSizes.p20),
        // User description
        ConstrainedBox(
          constraints: BoxConstraints(
            // make sure the description doesn't exceed max width and interfere with the user avatar
            maxWidth: isPortrait
                ? maxWidth
                : AppSizes.userDescriptionMaxWidthConstraint < maxWidth * 0.4
                ? AppSizes.userDescriptionMaxWidthConstraint
                : maxWidth * 0.4,
          ),
          child: Text(
            maxLines: AppSizes.userDescriptionMaxLines,
            overflow: TextOverflow.ellipsis,
            introductionData.description,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
        ),
        const SizedBox(height: AppSizes.p40),
        // External links buttons
        ExternalLinksWrap(externalLinks: externalLinks),
      ],
    );
  }
}
