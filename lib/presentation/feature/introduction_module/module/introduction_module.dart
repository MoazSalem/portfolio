import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/feature/introduction_module/widgets/info_layout.dart';
import 'package:portfolio/presentation/feature/introduction_module/widgets/numerical_descriptions_wrap.dart';

class IntroductionModule extends StatefulWidget {
  final IntroductionData introductionData;
  final List<ExternalLink> externalLinks;
  const IntroductionModule({
    super.key,
    required this.introductionData,
    required this.externalLinks,
  });

  @override
  State<IntroductionModule> createState() => _IntroductionModuleState();
}

class _IntroductionModuleState extends State<IntroductionModule>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // use layout builder to get the current allowed constrains
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // the inner paddings of the module
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSizes.moduleInnerVerticalPadding,
              horizontal: AppSizes.moduleInnerHorizontalPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // add some space to compensate for the navbar
                const SizedBox(height: AppSizes.p40),
                // User Info with Avatar
                InfoLayout(
                  introductionData: widget.introductionData,
                  externalLinks: widget.externalLinks,
                  maxWidth: constraints.maxWidth,
                ),
                const SizedBox(height: AppSizes.p40),
                // Numerical Descriptions under the info
                NumericalDescriptionsWrap(
                  numericalDescriptions:
                      widget.introductionData.numericalDescriptions,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
