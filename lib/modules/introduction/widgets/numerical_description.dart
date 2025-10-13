import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/sizes.dart';
import 'package:portfolio/core/models/user.dart';

class NumericalDescriptionWidget extends StatelessWidget {
  final NumericalDescription numericalDescription;
  final double numTextSize;
  const NumericalDescriptionWidget({
    super.key,
    required this.numericalDescription,
    required this.numTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizes.padding20,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: AppSizes.numericalDescriptionWidgetMinWidth,
            maxWidth: AppSizes.numericalDescriptionWidgetMaxWidth,
          ),
          child: Text(
            numericalDescription.title,
            style: TextStyle(
              height: AppSizes.textHeight,
              fontSize: AppSizes.font16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.padding8),
          child: Text(
            "${numericalDescription.value}",
            textAlign: TextAlign.justify,
            style: TextStyle(
              height: AppSizes.textHeight,
              fontSize: numTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
