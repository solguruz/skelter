import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/fonts.gen.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_skeleton/widgets/styling/input_decorations.dart';

enum AppThemeEnum {
  /// Dark theme is unused in the product, only use/test LightTheme.
  DarkTheme,
  LightTheme
}

class AppThemesData {
  static final Map<AppThemeEnum, ThemeData> themeData =
      <AppThemeEnum, ThemeData>{
    AppThemeEnum.LightTheme: ThemeData(
      splashFactory: NoSplash.splashFactory,
      useMaterial3: false,
      brightness: Brightness.light,
      primaryColor: AppColors.brand600,
      primaryColorLight: AppColors.brand600,
      primaryColorDark: AppColors.brand600,
      scaffoldBackgroundColor: Colors.white,
      bottomAppBarTheme: const BottomAppBarTheme(
        color: AppColors.bottomAppBarColorLight,
      ),
      unselectedWidgetColor: AppColors.unselectedColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: AppTextStyles.h6SemiBold.withColor(
          AppColors.textNeutralPrimary,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        dragHandleColor: AppColors.black.withOpacity(.10),
        dragHandleSize: const Size(38, 4),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Color.fromRGBO(41, 41, 52, 1)),
      ),
      fontFamily: FontFamily.inter,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: InputDecorations.labelStyleBright,
        hintStyle: InputDecorations.hintStyleBright,
        isDense: true,
      ),
      indicatorColor: AppColors.brand600,
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black54,
      ),
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: Colors.white,
        primarySwatch: AppColors.primarySwatches,
        accentColor: AppColors.brand700,
      ).copyWith(
        secondary: AppColors.brand700,
        primary: AppColors.brand600,
        background: Colors.white,
      ),
    ),
    AppThemeEnum.DarkTheme: ThemeData(
      splashFactory: NoSplash.splashFactory,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        color: AppColors.bgColorDark,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      primaryColor: AppColors.brand600,
      primaryColorLight: AppColors.brand600,
      primaryColorDark: AppColors.brand600,
      scaffoldBackgroundColor: AppColors.bgColorDark,
      unselectedWidgetColor: AppColors.unselectedColor,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: InputDecorations.labelStyleDark,
        hintStyle: InputDecorations.hintStyleDark,
        errorStyle: const TextStyle(color: Colors.redAccent),
        isDense: true,
      ),
      fontFamily: FontFamily.inter,
      indicatorColor: AppColors.brand600,
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white54,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: AppColors.bottomAppBarColorDark,
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: AppColors.primarySwatches,
        accentColor: AppColors.brand700,
        backgroundColor: AppColors.bgColorDark,
      )
          .copyWith(
            secondary: AppColors.brand700,
            background: AppColors.bgColorDark,
            primary: AppColors.brand600,
          )
          .copyWith(background: AppColors.bgColorDark),
    ),
  };
}
