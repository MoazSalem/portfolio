import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:portfolio/core/utils/assets.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/shared_widgets/circular_border_button.dart';
import 'package:portfolio/presentation/shared_widgets/svg_asset.dart';
import 'package:web/web.dart' as web show window;

class ExternalLinksWrap extends StatelessWidget {
  final List<ExternalLink> externalLinks;
  const ExternalLinksWrap({super.key, required this.externalLinks});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      runSpacing: AppSizes.p10,
      spacing: AppSizes.p10,
      children: List.generate(
        externalLinks.length,
        (i) => CircularBorderButton(
          onTap: () => web.window.open(externalLinks[i].url),
          child: i == 0
              ? Text(
                  "View Resume",
                  style: AppTypography.labelLarge.copyWith(
                    color: colorScheme.primary,
                  ),
                )
              : SvgAsset(
                  assetName: AppAssets.getSvgByName(
                    externalLinks[i].name.toLowerCase(),
                  ),
                  color: colorScheme.primary,
                ),
        ),
      ),
    );
  }
}
