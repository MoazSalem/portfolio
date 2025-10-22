import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/theme/sizes.dart';
import 'package:vector_graphics/vector_graphics.dart';

class SvgAsset extends StatelessWidget {
  final String assetName;
  final double iconSize;
  final BoxFit fit;
  final Color color;
  const SvgAsset({
    super.key,
    required this.assetName,
    this.iconSize = AppSizes.iconSize,
    this.fit = BoxFit.contain,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture(
      AssetBytesLoader(assetName),
      width: iconSize,
      height: iconSize,
      fit: fit,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
