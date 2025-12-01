import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';

class ModulesLink extends StatelessWidget {
  const ModulesLink({
    super.key,
    this.width = AppSizes.defaultLinkWidth,
    this.height = AppSizes.defaultLinkHeight,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
