import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

extension AppButtonStyleTextColors on AppButtonStyle {
  Color getTextColor(AppButtonState state) {
    switch (this) {
      case AppButtonStyle.primary:
        return _getPrimaryColor(state);
      case AppButtonStyle.secondary:
        return _getSecondaryColor(state);
      case AppButtonStyle.outline:
        return _getOutlineColor(state);
      case AppButtonStyle.link:
      case AppButtonStyle.textOrIcon:
        return _getLinkColor(state);
    }
  }

  Color _getPrimaryColor(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.hovered:
      case AppButtonState.focused:
        return AppColors.textNeutralWhite;
      case AppButtonState.disabled:
        return AppColors.textNeutralDisable;
    }
  }

  Color _getSecondaryColor(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.hovered:
      case AppButtonState.focused:
        return AppColors.textBrandSecondary;
      case AppButtonState.disabled:
        return AppColors.textNeutralDisable;
    }
  }

  Color _getOutlineColor(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.hovered:
      case AppButtonState.focused:
        return AppColors.textNeutralPrimary;
      case AppButtonState.disabled:
        return AppColors.textNeutralDisable;
    }
  }

  Color _getLinkColor(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.hovered:
      case AppButtonState.focused:
        return AppColors.textBrandSecondary;
      case AppButtonState.disabled:
        return AppColors.textNeutralDisable;
    }
  }
}
