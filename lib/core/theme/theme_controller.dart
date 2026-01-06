import 'package:flutter/material.dart';

class ThemeController {
  // Singleton instance
  static final ThemeController instance = ThemeController._();

  // Private constructor
  ThemeController._();

  // ValueNotifier to hold the current theme mode
  final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.dark);

  // Toggle between light and dark mode
  void toggleTheme() {
    if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.dark;
    }
  }

  // Get current theme mode
  ThemeMode get currentThemeMode => themeMode.value;

  // Dispose notifier (though rarely needed for a singleton)
  void dispose() {
    themeMode.dispose();
  }
}
