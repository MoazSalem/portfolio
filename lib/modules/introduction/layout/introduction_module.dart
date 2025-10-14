import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/sizes.dart';
import 'package:portfolio/core/models/user.dart';
import 'package:portfolio/modules/introduction/widgets/info_layout.dart';
import 'package:portfolio/modules/introduction/widgets/numerical_descriptions_wrap.dart';

class IntroductionModule extends StatelessWidget {
  final IntroductionData introductionData;
  final List<ExternalLink> externalLinks;
  const IntroductionModule({
    super.key,
    required this.introductionData,
    required this.externalLinks,
  });

  @override
  Widget build(BuildContext context) {
    // use layout builder to get the current allowed constrains
    return LayoutBuilder(
      builder: (context, constraints) {
        // bool to switch to vertical layout widgets
        bool isPortrait =
            constraints.maxWidth < constraints.maxHeight &&
            constraints.maxWidth < AppSizes.portraitBreakpoint;
        // bool to make the text smaller on small devices
        bool isSmallDevice =
            constraints.maxWidth < AppSizes.smallDeviceBreakpoint;
        // the inner paddings of the module
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.moduleInnerVerticalPadding,
            horizontal: AppSizes.moduleInnerHorizontalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // User Info with Avatar
              InfoLayout(
                introductionData: introductionData,
                externalLinks: externalLinks,
                maxWidth: constraints.maxWidth,
                isSmallDevice: isSmallDevice,
                isPortrait: isPortrait,
              ),
              SizedBox(height: AppSizes.padding60),
              // Numerical Descriptions under the info
              NumericalDescriptionsWrap(
                numericalDescriptions: introductionData.numericalDescriptions,
                maxWidth: constraints.maxWidth,
                isSmallDevice: isSmallDevice,
              ),
            ],
          ),
        );
      },
    );
  }
}
