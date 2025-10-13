import 'package:flutter/material.dart';

class AppTheme {
  /// Don't forget to update initial loading screen colors in web/index.html
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.cyanAccent,
      brightness: Brightness.dark,
    ),
  );
}
