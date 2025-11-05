import 'package:flutter/material.dart';
import 'package:skelter/main.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class AppButtonColor {
  static Color resolvePrimaryBg(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
        return rootNavigatorKey.currentContext?.currentTheme.bgBrandDefault ??
            AppColors.brand600;
      case AppButtonState.hovered:
        return rootNavigatorKey.currentContext?.currentTheme.bgBrandHover ??
            AppColors.brand500;
      case AppButtonState.focused:
        return rootNavigatorKey.currentContext?.currentTheme.bgBrandPressed ??
            AppColors.brand700;
      case AppButtonState.disabled:
        return rootNavigatorKey
                .currentContext?.currentTheme.bgNeutralDisabled ??
            AppColors.brand600;
    }
  }

  static Color resolveSecondaryBg(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
        return rootNavigatorKey.currentContext?.currentTheme.bgBrandLight50 ??
            AppColors.brand50;
      case AppButtonState.hovered:
        return rootNavigatorKey.currentContext?.currentTheme.bgBrandLight100 ??
            AppColors.brand100;
      case AppButtonState.focused:
        return rootNavigatorKey.currentContext?.currentTheme.bgBrandLight200 ??
            AppColors.brand200;
      case AppButtonState.disabled:
        return rootNavigatorKey
                .currentContext?.currentTheme.bgNeutralDisabled ??
            AppColors.neutral100;
    }
  }

  static Color resolveOutlineBorder(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.hovered:
        return rootNavigatorKey
                .currentContext?.currentTheme.strokeNeutralLight200 ??
            AppColors.neutral200;
      case AppButtonState.focused:
        return rootNavigatorKey
                .currentContext?.currentTheme.strokeNeutralDisabled ??
            AppColors.neutral400;
      case AppButtonState.disabled:
        return Colors.transparent;
    }
  }

  static Color resolveOutlineBg(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.focused:
        return rootNavigatorKey.currentContext?.currentTheme.bgShadesWhite ??
            AppColors.shadesWhite;
      case AppButtonState.hovered:
        return rootNavigatorKey.currentContext?.currentTheme.bgShadesWhite ??
            AppColors.shadesWhite;
      case AppButtonState.disabled:
        return rootNavigatorKey
                .currentContext?.currentTheme.bgNeutralDisabled ??
            AppColors.brand600;
    }
  }
}
