import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/typography.dart';

class AppTheme {
  const AppTheme._();

  /// Don't forget to update initial loading screen colors in web/index.html

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      primary: const Color(0xff1affa3),
      seedColor: const Color(0xff1affa3),
      // force white text
      onSurface: const Color(0xffffffff),
      brightness: Brightness.dark,
    ),
    fontFamily: 'Barlow',
    textTheme: AppTypography.defaultTextTheme,
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      primary: const Color(0xFF448AFF),
      seedColor: const Color(0xFF448AFF),
      brightness: Brightness.light,
    ),
    fontFamily: 'Barlow',
    textTheme: AppTypography.defaultTextTheme,
  );
}
