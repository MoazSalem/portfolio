import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/sizes.dart';
import 'package:portfolio/core/models/user.dart';
import 'package:portfolio/modules/introduction/widgets/numerical_description.dart';

class NumericalDescriptionsWrap extends StatelessWidget {
  final List<NumericalDescription> numericalDescriptions;
  final bool isSmallDevice;
  final double maxWidth;
  const NumericalDescriptionsWrap({
    super.key,
    required this.maxWidth,
    this.isSmallDevice = false,
    required this.numericalDescriptions,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: Wrap(
        spacing: AppSizes.padding20,
        runSpacing: AppSizes.padding20,
        alignment: WrapAlignment.spaceEvenly,
        children: List.generate(
          numericalDescriptions.length,
          (index) => NumericalDescriptionWidget(
            numericalDescription: numericalDescriptions[index],
            numTextSize: isSmallDevice ? AppSizes.font40 : AppSizes.font60,
          ),
        ),
      ),
    );
  }
}
