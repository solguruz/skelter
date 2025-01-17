part of 'app_button.dart';

enum AppButtonStyle {
  primary,
  secondary,
  outline,
  link,
  textOrIcon,
}

extension AppButtonStyleBoxDecorations on AppButtonStyle {
  BoxDecoration? decoration(
    AppButtonState state, {
    bool isDestructive = false,
    Color? bgColorOverride,
    Color? borderColorOverride,
    double? radiusOverride,
  }) {
    final double radius = radiusOverride ?? 12.0;
    switch (this) {
      case AppButtonStyle.primary:
        final Color color =
            bgColorOverride ?? _getPrimaryColor(state, isDestructive);
        return BoxDecoration(
          color: color,
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(radius),
        );
      case AppButtonStyle.secondary:
        final Color color =
            bgColorOverride ?? _getSecondaryColor(state, isDestructive);
        return BoxDecoration(
          color: color,
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(radius),
        );
      case AppButtonStyle.outline:
        return BoxDecoration(
          color:
              bgColorOverride ?? _getOutlineStateBgColor(state, isDestructive),
          border: Border.all(
            color: borderColorOverride ??
                _getOutlineStateBorderColor(state, isDestructive),
          ),
          borderRadius: BorderRadius.circular(radius),
        );
      case AppButtonStyle.link:
      case AppButtonStyle.textOrIcon:
        return null;
    }
  }

  Color _getPrimaryColor(AppButtonState state, bool isDestructive) {
    switch (state) {
      case AppButtonState.d_efault:
        return isDestructive
            ? AppColors.bgErrorDefault
            : AppColors.bgBrandDefault;
      case AppButtonState.hover:
        return isDestructive ? AppColors.bgErrorHover : AppColors.bgBrandHover;
      case AppButtonState.focus:
        return isDestructive
            ? AppColors.bgErrorPressed
            : AppColors.bgBrandPressed;
      case AppButtonState.disabled:
        return isDestructive
            ? AppColors.bgErrorDisabled
            : AppColors.bgNeutralDisabled;
    }
  }

  Color _getSecondaryColor(AppButtonState state, bool isDestructive) {
    switch (state) {
      case AppButtonState.d_efault:
        return isDestructive
            ? AppColors.bgErrorLight50
            : AppColors.bgBrandLight50;
      case AppButtonState.hover:
        return isDestructive
            ? AppColors.bgErrorLight100
            : AppColors.bgBrandLight100;
      case AppButtonState.focus:
        return isDestructive
            ? AppColors.bgErrorLight200
            : AppColors.bgBrandLight200;
      case AppButtonState.disabled:
        return isDestructive
            ? AppColors.bgNeutralDisabled
            : AppColors.bgNeutralDisabled;
    }
  }

  Color _getOutlineStateBorderColor(
    AppButtonState state,
    bool isDestructive,
  ) {
    switch (state) {
      case AppButtonState.d_efault:
        return isDestructive
            ? AppColors.strokeErrorDisabled
            : AppColors.strokeNeutralLight200;
      case AppButtonState.hover:
        return isDestructive
            ? AppColors.strokeErrorDisabled
            : AppColors.strokeNeutralLight200;
      case AppButtonState.focus:
        return isDestructive
            ? AppColors.strokeErrorDisabled
            : AppColors.strokeNeutralDisabled;
      case AppButtonState.disabled:
        return Colors.transparent;
    }
  }

  Color? _getOutlineStateBgColor(
    AppButtonState state,
    bool isDestructive,
  ) {
    switch (state) {
      case AppButtonState.d_efault:
        return isDestructive
            ? AppColors.bgShadesWhite
            : AppColors.bgShadesWhite;
      case AppButtonState.hover:
        return isDestructive
            ? AppColors.bgErrorLight50
            : AppColors.bgShadesWhite;
      case AppButtonState.focus:
        return isDestructive
            ? AppColors.bgShadesWhite
            : AppColors.bgShadesWhite;
      case AppButtonState.disabled:
        return isDestructive
            ? AppColors.bgNeutralDisabled
            : AppColors.bgNeutralDisabled;
    }
  }
}

extension AppButtonStyleTextColors on AppButtonStyle {
  Color getTextColor(
    AppButtonState state, {
    bool isDestructive = false,
  }) {
    switch (this) {
      case AppButtonStyle.primary:
        return _getPrimaryColor(state, isDestructive);
      case AppButtonStyle.secondary:
        return _getSecondaryColor(state, isDestructive);
      case AppButtonStyle.outline:
        return _getOutlineColor(state, isDestructive);
      case AppButtonStyle.link:
      case AppButtonStyle.textOrIcon:
        return _getLinkColor(state, isDestructive);
    }
  }

  Color _getPrimaryColor(AppButtonState state, bool isDestructive) {
    switch (state) {
      case AppButtonState.d_efault:
      case AppButtonState.hover:
      case AppButtonState.focus:
        return isDestructive
            ? AppColors.textNeutralWhite
            : AppColors.textNeutralWhite;
      case AppButtonState.disabled:
        return isDestructive
            ? AppColors.textNeutralDisable
            : AppColors.textNeutralDisable;
    }
  }

  Color _getSecondaryColor(AppButtonState state, bool isDestructive) {
    switch (state) {
      case AppButtonState.d_efault:
      case AppButtonState.hover:
      case AppButtonState.focus:
        return isDestructive
            ? AppColors.textErrorSecondary
            : AppColors.textBrandSecondary;
      case AppButtonState.disabled:
        return isDestructive
            ? AppColors.textNeutralDisable
            : AppColors.textNeutralDisable;
    }
  }

  Color _getOutlineColor(AppButtonState state, bool isDestructive) {
    switch (state) {
      case AppButtonState.d_efault:
      case AppButtonState.hover:
      case AppButtonState.focus:
        return isDestructive
            ? AppColors.textErrorSecondary
            : AppColors.textNeutralPrimary;
      case AppButtonState.disabled:
        return isDestructive
            ? AppColors.textNeutralDisable
            : AppColors.textNeutralDisable;
    }
  }

  Color _getLinkColor(AppButtonState state, bool isDestructive) {
    switch (state) {
      case AppButtonState.d_efault:
      case AppButtonState.hover:
      case AppButtonState.focus:
        return isDestructive
            ? AppColors.textErrorSecondary
            : AppColors.textBrandSecondary;
      case AppButtonState.disabled:
        return isDestructive
            ? AppColors.textNeutralDisable
            : AppColors.textNeutralDisable;
    }
  }
}
