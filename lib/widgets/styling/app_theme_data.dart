// Packages still built on the legacy `package:flutter/material.dart` read
// their theme from that library.
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

  /// [themeData] for widgets from packages that still use the legacy
  /// `package:flutter/material.dart`.
  static legacy.ThemeData legacyThemeData(Brightness brightness) {
    final backgroundColor = brightness == .light
        ? AppColors.bgSurfaceBase
        : AppColors.bgSurfaceBaseDark;
    return legacy.ThemeData(
      splashFactory: legacy.NoSplash.splashFactory,
      useMaterial3: false,
      brightness: brightness,
      appBarTheme: legacy.AppBarTheme(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
    );
  }
}
