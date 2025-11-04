import 'package:flutter/material.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

enum AppThemeEnum { DarkTheme, LightTheme }

class AppThemesData {
  static final Map<AppThemeEnum, ThemeData> themeData =
      <AppThemeEnum, ThemeData>{
    AppThemeEnum.LightTheme: ThemeData(
      splashFactory: NoSplash.splashFactory,
      useMaterial3: false,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.bgSurfaceBase,
      ),
      scaffoldBackgroundColor: AppColors.bgSurfaceBase,
    ),
    AppThemeEnum.DarkTheme: ThemeData(
      splashFactory: NoSplash.splashFactory,
      brightness: Brightness.dark,
      useMaterial3: false,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.bgSurfaceBaseDark,
      ),
      scaffoldBackgroundColor: AppColors.bgSurfaceBaseDark,
    ),
  };
}
