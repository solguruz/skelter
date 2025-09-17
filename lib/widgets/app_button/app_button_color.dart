import 'package:flutter/material.dart';
import 'package:skelter/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class AppButtonColor {
  static Color resolvePrimaryBg(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
        return AppColors.currentTheme.bgBrandDefault;
      case AppButtonState.hovered:
        return AppColors.currentTheme.bgBrandHover;
      case AppButtonState.focused:
        return AppColors.currentTheme.bgBrandPressed;
      case AppButtonState.disabled:
        return AppColors.currentTheme.bgNeutralDisabled;
    }
  }

  static Color resolveSecondaryBg(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
        return AppColors.currentTheme.bgBrandLight50;
      case AppButtonState.hovered:
        return AppColors.currentTheme.bgBrandLight100;
      case AppButtonState.focused:
        return AppColors.currentTheme.bgBrandLight200;
      case AppButtonState.disabled:
        return AppColors.currentTheme.bgNeutralDisabled;
    }
  }

  static Color resolveOutlineBorder(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.hovered:
        return AppColors.currentTheme.strokeNeutralLight200;
      case AppButtonState.focused:
        return AppColors.currentTheme.strokeNeutralDisabled;
      case AppButtonState.disabled:
        return Colors.transparent;
    }
  }

  static Color resolveOutlineBg(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.focused:
        return AppColors.currentTheme.bgShadesWhite;
      case AppButtonState.hovered:
        return AppColors.currentTheme.bgShadesWhite;
      case AppButtonState.disabled:
        return AppColors.currentTheme.bgNeutralDisabled;
    }
  }
}
