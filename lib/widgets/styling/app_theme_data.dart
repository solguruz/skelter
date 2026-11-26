import 'package:flutter/material.dart' as legacy;
import 'package:material_ui/material_ui.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

enum AppThemeEnum { DarkTheme, LightTheme }

class AppThemesData {
  static final Map<AppThemeEnum, ThemeData> themeData =
      <AppThemeEnum, ThemeData>{
        AppThemeEnum.LightTheme: ThemeData(
          splashFactory: NoSplash.splashFactory,
          useMaterial3: false,
          brightness: .light,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: AppColors.bgSurfaceBase,
          ),
          scaffoldBackgroundColor: AppColors.bgSurfaceBase,
        ),
        AppThemeEnum.DarkTheme: ThemeData(
          splashFactory: NoSplash.splashFactory,
          brightness: .dark,
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: AppColors.bgSurfaceBaseDark,
          ),
          scaffoldBackgroundColor: AppColors.bgSurfaceBaseDark,
        ),
      };

  /// Same themes for packages that still use package:flutter/material.dart.
  /// Keep in sync with [themeData].
  static final Map<AppThemeEnum, legacy.ThemeData> legacyThemeData =
      <AppThemeEnum, legacy.ThemeData>{
        AppThemeEnum.LightTheme: legacy.ThemeData(
          splashFactory: legacy.NoSplash.splashFactory,
          useMaterial3: false,
          brightness: .light,
          appBarTheme: const legacy.AppBarTheme(
            elevation: 0,
            backgroundColor: AppColors.bgSurfaceBase,
          ),
          scaffoldBackgroundColor: AppColors.bgSurfaceBase,
        ),
        AppThemeEnum.DarkTheme: legacy.ThemeData(
          splashFactory: legacy.NoSplash.splashFactory,
          brightness: .dark,
          useMaterial3: false,
          appBarTheme: const legacy.AppBarTheme(
            elevation: 0,
            backgroundColor: AppColors.bgSurfaceBaseDark,
          ),
          scaffoldBackgroundColor: AppColors.bgSurfaceBaseDark,
        ),
      };
}
