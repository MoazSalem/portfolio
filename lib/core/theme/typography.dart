import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';

class AppTypography {
  const AppTypography._();

  static const Color _darkTextColor = Color(0xffffffff);

  static const TextTheme darkTextTheme = TextTheme(
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
  );

  static const TextStyle headlineLarge = TextStyle(
    height: AppSizes.textHeight,
    fontSize: AppSizes.font24,
    fontWeight: FontWeight.bold,
    color: _darkTextColor,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: AppSizes.font16,
    fontWeight: FontWeight.bold,
    color: _darkTextColor,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: AppSizes.font20,
    fontWeight: FontWeight.w300,
    color: _darkTextColor,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: AppSizes.font16,
    fontWeight: FontWeight.w600,
    color: _darkTextColor,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: AppSizes.font12,
    fontWeight: FontWeight.w400,
    color: _darkTextColor,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: AppSizes.font10,
    fontWeight: FontWeight.w400,
    color: _darkTextColor,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: AppSizes.font16,
    fontWeight: FontWeight.w700,
    color: _darkTextColor,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: AppSizes.font14,
    fontWeight: FontWeight.w500,
    color: _darkTextColor,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: AppSizes.font10,
    fontWeight: FontWeight.w400,
    color: _darkTextColor,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: AppSizes.font18,
    fontWeight: FontWeight.w400,
    color: _darkTextColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: AppSizes.font12,
    fontWeight: FontWeight.w500,
    color: _darkTextColor,
  );
}
