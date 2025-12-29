import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';

class CircularBorderButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final Color? color;
  const CircularBorderButton({
    super.key,
    required this.onTap,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: StadiumBorder(
        side: BorderSide(
          width: AppSizes.outlineWidth,
          color: color ?? Theme.of(context).colorScheme.outline,
        ),
      ),
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSizes.circularRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.p16),
          child: child,
        ),
      ),
    );
  }
}
