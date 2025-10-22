import 'package:flutter/material.dart';
import 'package:portfolio/core/models/user.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/modules/introduction/widgets/introduction_text_column.dart';

class InfoLayout extends StatelessWidget {
  final IntroductionData introductionData;
  final List<ExternalLink> externalLinks;
  final double maxWidth;
  final bool isSmallDevice;
  final bool isPortrait;
  const InfoLayout({
    super.key,
    required this.maxWidth,
    required this.isSmallDevice,
    required this.introductionData,
    required this.externalLinks,
    required this.isPortrait,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: isPortrait ? Axis.vertical : Axis.horizontal,
      spacing: AppSizes.p60,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isPortrait)
          // User avatar in portrait mode
          CircleAvatar(
            radius: isSmallDevice
                ? AppSizes.userAvatarRadiusSmall
                : AppSizes.userAvatarRadiusBig,
            backgroundImage: NetworkImage(introductionData.avatarUrl),
          ),
        // User info
        IntroductionTextColumn(
          introductionData: introductionData,
          externalLinks: externalLinks,
          maxWidth: maxWidth,
          isPortrait: isPortrait,
          isSmallDevice: isSmallDevice,
        ),
        if (!isPortrait)
          // User avatar in landscape mode
          CircleAvatar(
            radius: isSmallDevice
                ? AppSizes.userAvatarRadiusSmall
                : AppSizes.userAvatarRadiusBig,
            backgroundImage: NetworkImage(introductionData.avatarUrl),
          ),
      ],
    );
  }
}
