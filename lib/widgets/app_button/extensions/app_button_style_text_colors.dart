import 'package:flutter/material.dart';
import 'package:skelter/main.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

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
        return rootNavigatorKey.currentContext?.currentTheme.textNeutralWhite ??
            AppColors.white;
      case AppButtonState.disabled:
        return rootNavigatorKey
                .currentContext?.currentTheme.textNeutralDisable ??
            AppColors.white;
    }
  }

  Color _getSecondaryColor(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.hovered:
      case AppButtonState.focused:
        return rootNavigatorKey
                .currentContext?.currentTheme.textBrandSecondary ??
            AppColors.brand700;
      case AppButtonState.disabled:
        return rootNavigatorKey
                .currentContext?.currentTheme.textNeutralDisable ??
            AppColors.neutral400;
    }
  }

  Color _getOutlineColor(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.hovered:
      case AppButtonState.focused:
        return rootNavigatorKey
                .currentContext?.currentTheme.textNeutralPrimary ??
            AppColors.neutral900;
      case AppButtonState.disabled:
        return rootNavigatorKey
                .currentContext?.currentTheme.textNeutralDisable ??
            AppColors.neutral400;
    }
  }

  Color _getLinkColor(AppButtonState state) {
    switch (state) {
      case AppButtonState.normal:
      case AppButtonState.hovered:
      case AppButtonState.focused:
        return rootNavigatorKey
                .currentContext?.currentTheme.textBrandSecondary ??
            AppColors.brand700;
      case AppButtonState.disabled:
        return rootNavigatorKey
                .currentContext?.currentTheme.textNeutralDisable ??
            AppColors.neutral400;
    }
  }
}
