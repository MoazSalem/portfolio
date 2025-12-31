import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/feature/introduction_module/widgets/numerical_description.dart';

class NumericalDescriptionsWrap extends StatelessWidget {
  final List<NumericalDescription> numericalDescriptions;
  const NumericalDescriptionsWrap({
    super.key,
    required this.numericalDescriptions,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        // Determine the number of columns based on the max width
        // If we have enough space for 4 items (assuming a breakpoint around 850), use 4, else 2.
        // We can tune the breakpoint. The moduleMinWidth is 800.
        // If we want either 2 or 4:
        final int crossAxisCount = maxWidth >= 850 ? 4 : 2;

        const double spacing = AppSizes.p10;
        // Calculate the width for each item to fill the row
        // Total Width = (ItemWidth * Count) + (Spacing * (Count - 1))
        // ItemWidth = (TotalWidth - (Spacing * (Count - 1))) / Count
        final double itemWidth =
            (maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          // We don't strictly need alignment if we force width, but good to have
          alignment: WrapAlignment.start,
          children: List.generate(
            numericalDescriptions.length,
            (index) => SizedBox(
              width: itemWidth,
              child: NumericalDescriptionWidget(
                numericalDescription: numericalDescriptions[index],
                index: index,
              ),
            ),
          ),
        );
      },
    );
  }
}
