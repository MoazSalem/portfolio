import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:portfolio/core/utils/assets.dart';
import 'package:portfolio/domain/entities/user.dart';
import 'package:portfolio/presentation/shared_widgets/circular_border_button.dart';
import 'package:portfolio/presentation/shared_widgets/svg_asset.dart';
import 'package:web/web.dart' as web show window;

class ContactModule extends StatefulWidget {
  const ContactModule({super.key, this.email, this.externalLinks});
  final String? email;
  final List<ExternalLink>? externalLinks;

  @override
  State<ContactModule> createState() => _ContactModuleState();
}

class _ContactModuleState extends State<ContactModule>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSizes.moduleInnerVerticalPadding,
          left: AppSizes.moduleInnerHorizontalPadding,
          right: AppSizes.moduleInnerHorizontalPadding,
          bottom: AppSizes.p40,
        ),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: "Let's ",
                style: theme.textTheme.headlineSmall?.copyWith(
                  height: 1,
                  color: theme.colorScheme.onSurface,
                ),
                children: [
                  TextSpan(
                    text: "Connect",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.p40, width: double.infinity),
            Text(
              "How did you reach here? What are you looking for? did you like any of my projects? I would love to hear from you over email!",
              style: theme.textTheme.displayMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSizes.p40),
            CircularBorderButton(
              onTap: () => web.window.open('mailto:${widget.email}'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.email,
                    color: theme.colorScheme.primary,
                    size: AppSizes.iconSize,
                  ),
                  const SizedBox(width: AppSizes.p10),
                  Text(
                    widget.email ?? "Reach Out to Me",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.p20),
            if (widget.externalLinks != null)
              Wrap(
                runSpacing: AppSizes.p10,
                spacing: AppSizes.p10,
                children: List.generate(
                  widget.externalLinks!.length - 1,
                  (i) => CircularBorderButton(
                    onTap: () => web.window.open(widget.externalLinks![i].url),
                    child: SvgAsset(
                      assetName: AppAssets.getSvgByName(
                        widget.externalLinks![i].name.toLowerCase(),
                      ),
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: AppSizes.p40),
            RichText(
              text: TextSpan(
                text: "Made with ",
                style: theme.textTheme.labelSmall?.copyWith(
                  height: 1,
                  color: theme.colorScheme.onSurface,
                ),
                children: [
                  TextSpan(
                    text: "Flutter",
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const TextSpan(text: " by "),
                  TextSpan(
                    text: "MoazSalem",
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  TextSpan(
                    text: "  © 2026",
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
