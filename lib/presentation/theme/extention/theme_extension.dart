import 'package:flutter/material.dart';
import 'package:skelter/presentation/theme/dark_app_colors.dart';
import 'package:skelter/presentation/theme/light_app_colors.dart';
import 'package:skelter/presentation/theme/theme_color_palette.dart';

extension ThemeExtension on BuildContext {
  ThemeColorPalette get currentTheme =>
      Theme.of(this).brightness == Brightness.dark
          ? DarkAppColors()
          : LightAppColors();
}
