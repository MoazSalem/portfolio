import 'package:flutter/material.dart';
import 'package:portfolio/core/models/user.dart';
import 'package:portfolio/core/shared_widgets/circular_border_button.dart';
import 'package:portfolio/core/shared_widgets/svg_asset.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/core/utils/assets.dart';
import 'package:web/web.dart' as web show window;

class ExternalLinksWrap extends StatelessWidget {
  final List<ExternalLink> externalLinks;
  const ExternalLinksWrap({super.key, required this.externalLinks});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      spacing: AppSizes.p10,
      children: List.generate(
        externalLinks.length,
        (i) => CircularBorderButton(
          onTap: () => web.window.open(externalLinks[i].url),
          child: i == 0
              ? Row(
                  spacing: AppSizes.p10,
                  children: [
                    const Text(
                      "VIEW CV",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SvgAsset(
                      assetName: AppAssets.getSvgByName(
                        externalLinks[i].name.toLowerCase(),
                      ),
                      color: colorScheme.primary,
                    ),
                  ],
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
