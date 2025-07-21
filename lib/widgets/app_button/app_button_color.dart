import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class AppButtonColor {
  static Color resolvePrimaryBg(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
        return AppColors.bgBrandDefault;
      case AppButtonState.hovered:
        return AppColors.bgBrandHover;
      case AppButtonState.focused:
        return AppColors.bgBrandPressed;
      case AppButtonState.disabled:
        return AppColors.bgNeutralDisabled;
    }
  }

  static Color resolveSecondaryBg(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
        return AppColors.bgBrandLight50;
      case AppButtonState.hovered:
        return AppColors.bgBrandLight100;
      case AppButtonState.focused:
        return AppColors.bgBrandLight200;
      case AppButtonState.disabled:
        return AppColors.bgNeutralDisabled;
    }
  }

  static Color resolveOutlineBorder(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.hovered:
        return AppColors.strokeNeutralLight200;
      case AppButtonState.focused:
        return AppColors.strokeNeutralDisabled;
      case AppButtonState.disabled:
        return Colors.transparent;
    }
  }

  static Color resolveOutlineBg(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.focused:
        return AppColors.bgShadesWhite;
      case AppButtonState.hovered:
        return AppColors.bgShadesWhite;
      case AppButtonState.disabled:
        return AppColors.bgNeutralDisabled;
    }
  }
}
