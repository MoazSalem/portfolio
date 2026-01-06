import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';

class AppTypography {
  const AppTypography._();

  static const Color _defaultTextColor = Color(0xffffffff);

  static const TextTheme defaultTextTheme = TextTheme(
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
    color: _defaultTextColor,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: AppSizes.font60,
    fontWeight: FontWeight.bold,
    color: _defaultTextColor,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: AppSizes.font50,
    fontWeight: FontWeight.bold,
    color: _defaultTextColor,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: AppSizes.font30,
    fontWeight: FontWeight.w600,
    color: _defaultTextColor,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: AppSizes.font24,
    fontWeight: FontWeight.w400,
    color: _defaultTextColor,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: AppSizes.font16,
    fontWeight: FontWeight.w600,
    color: _defaultTextColor,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: AppSizes.font40,
    fontWeight: FontWeight.w600,
    color: _defaultTextColor,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: AppSizes.font24,
    fontWeight: FontWeight.w600,
    color: _defaultTextColor,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: AppSizes.font10,
    fontWeight: FontWeight.w400,
    color: _defaultTextColor,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: AppSizes.font24,
    fontWeight: FontWeight.w400,
    color: _defaultTextColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: AppSizes.font18,
    fontWeight: FontWeight.w500,
    color: _defaultTextColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: AppSizes.font18,
    fontWeight: FontWeight.w400,
    color: _defaultTextColor,
  );

  static const TextStyle displayLarge = TextStyle(
    fontSize: AppSizes.font24,
    fontWeight: FontWeight.w700,
    color: _defaultTextColor,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: AppSizes.font20,
    fontWeight: FontWeight.w700,
    color: _defaultTextColor,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: AppSizes.font12,
    fontWeight: FontWeight.w700,
    color: _defaultTextColor,
  );
}
