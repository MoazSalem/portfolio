import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  /// Don't forget to update initial loading screen colors in web/index.html
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      primary: const Color(0xff1affa3),
      seedColor: const Color(0xff1affa3),
      brightness: Brightness.dark,
    ),
    fontFamily: 'Barlow',
  );
}
