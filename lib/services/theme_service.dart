import 'package:flutter/material.dart';
import 'package:skelter/shared_pref/prefs.dart';

class ThemeService {
  static const _themeModeKey = 'theme_mode';

  Future<void> saveThemeMode(ThemeMode mode) async {
    await Prefs.setString(_themeModeKey, mode.name);
  }

  Future<ThemeMode> getThemeMode() async {
    final savedMode = await Prefs.getString(_themeModeKey);
    if (savedMode == null) return ThemeMode.system;

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == savedMode,
      orElse: () => ThemeMode.system,
    );
  }
}
