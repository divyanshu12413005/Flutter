import 'package:flutter/material.dart';

class AppThemeController {
  AppThemeController._();

  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(
    ThemeMode.light,
  );

  static void changeTheme(ThemeMode mode) {
    themeMode.value = mode;
  }
}
