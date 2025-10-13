import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/sizes.dart';
import 'package:portfolio/core/models/user.dart';
import 'package:portfolio/modules/introduction/widgets/external_links_wrap.dart';

class IntroductionTextColumn extends StatelessWidget {
  final IntroductionData introductionData;
  final List<ExternalLink> externalLinks;
  final double maxWidth;
  final bool isPortrait;
  final bool isSmallDevice;
  const IntroductionTextColumn({
    super.key,
    required this.maxWidth,
    required this.isPortrait,
    required this.isSmallDevice,
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
        Text(
          introductionData.title,
          style: TextStyle(
            height: AppSizes.textHeight,
            fontSize: AppSizes.font20,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: AppSizes.padding10),
        Text(
          'Hello I\'m',
          style: TextStyle(
            height: AppSizes.textHeight,
            fontSize: isSmallDevice ? AppSizes.font50 : AppSizes.font80,
            fontWeight: FontWeight.bold,
          ),
        ),
        // User name
        Text(
          introductionData.name,
          style: TextStyle(
            height: AppSizes.textHeight,
            color: theme.colorScheme.primary,
            fontSize: isSmallDevice ? AppSizes.font50 : AppSizes.font80,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSizes.padding20),
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
            style: TextStyle(
              color: theme.colorScheme.outline,
              fontSize: AppSizes.font18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: AppSizes.padding20),
        // External links buttons
        ExternalLinksWrap(externalLinks: externalLinks),
      ],
    );
  }
}
