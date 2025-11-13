import 'package:flutter/material.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/enums/app_button_state_enum.dart';

class AppButtonColor {
  static Color resolvePrimaryBg(BuildContext context, AppButtonState state) {
    final theme = context.currentTheme;
    switch (state) {
      case AppButtonState.normal:
        return theme.bgBrandDefault;
      case AppButtonState.hovered:
        return theme.bgBrandHover;
      case AppButtonState.focused:
        return theme.bgBrandPressed;
      case AppButtonState.disabled:
        return theme.bgNeutralDisabled;
    }
  }

  static Color resolveSecondaryBg(BuildContext context, AppButtonState state) {
    final theme = context.currentTheme;
    switch (state) {
      case AppButtonState.normal:
        return theme.bgBrandLight50;
      case AppButtonState.hovered:
        return theme.bgBrandLight100;
      case AppButtonState.focused:
        return theme.bgBrandLight200;
      case AppButtonState.disabled:
        return theme.bgNeutralDisabled;
    }
  }

  static Color resolveOutlineBorder(
    BuildContext context,
    AppButtonState state,
  ) {
    final theme = context.currentTheme;
    switch (state) {
      case AppButtonState.normal:
        return theme.strokeNeutralLight200;
      case AppButtonState.hovered:
        return theme.strokeNeutralLight200;
      case AppButtonState.focused:
        return theme.strokeNeutralDisabled;
      case AppButtonState.disabled:
        return Colors.transparent;
    }
  }

  static Color resolveOutlineBg(BuildContext context, AppButtonState state) {
    final theme = context.currentTheme;
    switch (state) {
      case AppButtonState.normal:
        return theme.bgShadesWhite;
      case AppButtonState.hovered:
        return theme.bgShadesWhite;
      case AppButtonState.focused:
        return theme.bgShadesWhite;
      case AppButtonState.disabled:
        return theme.bgNeutralDisabled;
    }
  }
}
