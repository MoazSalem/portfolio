import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/feature/introduction_module/widgets/numerical_description.dart';

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
        spacing: AppSizes.p20,
        runSpacing: AppSizes.p20,
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
