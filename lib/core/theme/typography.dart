import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';

class AppTypography {
  const AppTypography._();

  static const Color _darkTextColor = Color(0xffffffff);

  static const TextTheme darkTextTheme = TextTheme(
    headlineLarge: headlineLarge,
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
    bodySmall: bodySmall,
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
  );

  // font sizes will be changed through the development process

  static const TextStyle headlineLarge = TextStyle(
    height: AppSizes.textHeight,
    fontSize: AppSizes.font70,
    fontWeight: FontWeight.bold,
    color: _darkTextColor,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: AppSizes.font60,
    fontWeight: FontWeight.bold,
    color: _darkTextColor,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: AppSizes.font30,
    fontWeight: FontWeight.w300,
    color: _darkTextColor,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: AppSizes.font30,
    fontWeight: FontWeight.w600,
    color: _darkTextColor,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: AppSizes.font24,
    fontWeight: FontWeight.w400,
    color: _darkTextColor,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: AppSizes.font16,
    fontWeight: FontWeight.w600,
    color: _darkTextColor,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: AppSizes.font30,
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
    fontSize: AppSizes.font24,
    fontWeight: FontWeight.w400,
    color: _darkTextColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: AppSizes.font18,
    fontWeight: FontWeight.w500,
    color: _darkTextColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: AppSizes.font18,
    fontWeight: FontWeight.w400,
    color: _darkTextColor,
  );

  static const TextStyle displayLarge = TextStyle(
    fontSize: AppSizes.font24,
    fontWeight: FontWeight.w700,
    color: _darkTextColor,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: AppSizes.font20,
    fontWeight: FontWeight.w700,
    color: _darkTextColor,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: AppSizes.font16,
    fontWeight: FontWeight.w700,
    color: _darkTextColor,
  );
}
