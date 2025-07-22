import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button_icon.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button_label.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button_loader.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/extensions/app_button_decoration.dart';
import 'package:flutter_skeleton/widgets/app_button/extensions/app_button_size_extension.dart';
import 'package:flutter_skeleton/widgets/app_button/extensions/app_button_style_text_colors.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class AppButton extends StatelessWidget {
  final AppButtonStyle style;
  final AppButtonSize size;
  final AppButtonState state;
  final String? label;
  final bool isIconButton;

  final String? iconPath;
  final IconData? iconData;
  final String? leftIconPath;
  final IconData? leftIcon;
  final String? rightIconPath;
  final IconData? rightIcon;
  final bool isLeftIconAttachedToText;
  final bool isRightAppIconAttachedToText;

  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;

  final VoidCallback? onPressed;
  final bool isLoading;
  final bool shouldSetFullWidth;

  final bool isAppBarAction;
  final double? appBarActionVerticalPadding;
  final double? appBarActionRightPadding;
  final double? appBarActionLeftPadding;

  const AppButton({
    super.key,
    this.style = AppButtonStyle.primary,
    this.size = AppButtonSize.small,
    this.state = AppButtonState.normal,
    this.isIconButton = false,
    this.onPressed,
    this.iconPath,
    this.iconData,
    this.label,
    this.leftIconPath,
    this.leftIcon,
    this.rightIconPath,
    this.rightIcon,
    this.isLeftIconAttachedToText = false,
    this.isRightAppIconAttachedToText = false,
    this.foregroundColor,
    this.backgroundColor,
    this.borderColor,
    this.isLoading = false,
    this.isAppBarAction = false,
    this.appBarActionRightPadding,
    this.appBarActionLeftPadding,
    this.appBarActionVerticalPadding,
    this.shouldSetFullWidth = false,
    this.borderRadius,
  });

  factory AppButton.icon({
    String? appIcon,
    IconData? iconData,
    AppButtonSize? size,
    AppButtonState? state,
    required VoidCallback onPressed,
    Color? iconOrTextColorOverride = AppColors.iconNeutralDefault,
    bool isAppBarAction = false,
    double? appBarActionRightPadding,
  }) {
    return AppButton(
      style: AppButtonStyle.textOrIcon,
      size: size ?? AppButtonSize.small,
      state: state ?? AppButtonState.normal,
      iconData: iconData,
      isIconButton: true,
      iconPath: appIcon,
      onPressed: onPressed,
      foregroundColor: iconOrTextColorOverride,
      isAppBarAction: isAppBarAction,
      appBarActionRightPadding: appBarActionRightPadding,
    );
  }

  factory AppButton.primary({
    required String label,
    AppButtonSize? size,
    AppButtonState? state,
    required VoidCallback onPressed,
    Color? iconOrTextColorOverride,
    bool isAppBarAction = false,
    bool? showLoader,
    double? radiusOverride,
  }) {
    return AppButton(
      size: size ?? AppButtonSize.small,
      state: state ?? AppButtonState.normal,
      label: label,
      onPressed: onPressed,
      foregroundColor: iconOrTextColorOverride,
      isAppBarAction: isAppBarAction,
      isLoading: showLoader ?? false,
      borderRadius: radiusOverride,
    );
  }

  @override
  Widget build(BuildContext context) {
    final visualContent = Stack(
      alignment: Alignment.center,
      children: [
        _buildChild(),
        if (isLoading)
          AppButtonLoader(
            style: style,
            state: state,
            size: size,
          ),
      ],
    );

    final baseButton = InkWell(
      splashFactory: NoSplash.splashFactory,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      onTap: onPressed,
      child: Container(
        height: size.height,
        width: isIconButton
            ? size.height
            : shouldSetFullWidth
                ? double.infinity
                : null,
        padding: _resolvePadding(),
        decoration: style.toBoxDecoration(
          state,
          bgColorOverride: backgroundColor,
          borderColorOverride: borderColor,
          borderRadiusOverride: borderRadius,
        ),
        child: visualContent,
      ),
    );

    return isAppBarAction
        ? Padding(
            padding: EdgeInsets.only(
              top: appBarActionVerticalPadding ?? 13,
              bottom: appBarActionVerticalPadding ?? 13,
              left: appBarActionLeftPadding ?? 0,
              right: appBarActionRightPadding ?? 16,
            ),
            child: baseButton,
          )
        : baseButton;
  }

  Widget _buildChild() {
    if (isIconButton) {
      return _buildIcon(iconPath, iconData);
    }

    final hasLeadingIcon = leftIconPath != null || leftIcon != null;
    final hasTrailingIcon = rightIconPath != null || rightIcon != null;

    if (hasLeadingIcon && hasTrailingIcon) {
      return _buildWithLeadingAndTrailingIcons();
    }
    if (hasLeadingIcon) return _buildWithLeadingIcon();
    if (hasTrailingIcon) return _buildWithTrailingIcon();

    return _buildLabel();
  }

  Widget _buildWithLeadingAndTrailingIcons() {
    return Row(
      children: [
        _buildIcon(leftIconPath, leftIcon),
        const Spacer(),
        _buildLabel(),
        const Spacer(),
        _buildIcon(rightIconPath, rightIcon),
      ],
    );
  }

  Widget _buildWithLeadingIcon() {
    return Row(
      children: [
        if (isLeftIconAttachedToText) ...[
          const Spacer(),
          _buildIcon(leftIconPath, leftIcon),
        ] else ...[
          _buildIcon(leftIconPath, leftIcon),
          const Spacer(),
        ],
        SizedBox(width: size.spacing),
        _buildLabel(),
        const Spacer(),
      ],
    );
  }

  Widget _buildWithTrailingIcon() {
    return Row(
      mainAxisSize:
          isRightAppIconAttachedToText ? MainAxisSize.max : MainAxisSize.min,
      children: [
        const Spacer(),
        _buildLabel(),
        if (isRightAppIconAttachedToText) ...[
          SizedBox(width: size.spacing),
          Flexible(child: _buildIcon(rightIconPath, rightIcon)),
        ] else ...[
          const Spacer(),
          _buildIcon(rightIconPath, rightIcon),
        ],
        if (isRightAppIconAttachedToText) const Spacer(),
      ],
    );
  }

  Widget _buildLabel() {
    return AppButtonLabel(
      label: label ?? '',
      style: style,
      size: size,
      state: state,
      foregroundColor: foregroundColor,
      isLoading: isLoading,
    );
  }

  Widget _buildIcon(String? path, IconData? icon) {
    return AppButtonIcon(
      iconPath: path,
      iconData: icon,
      size: size.iconSize,
      color: _resolveTextColor(),
    );
  }

  Color _resolveTextColor() {
    if (foregroundColor != null) return foregroundColor!;
    return isLoading ? Colors.transparent : style.getTextColor(state);
  }

  EdgeInsets? _resolvePadding() {
    if (isIconButton) return EdgeInsets.zero;
    if (style == AppButtonStyle.link || style == AppButtonStyle.textOrIcon) {
      return EdgeInsets.zero;
    }
    return size.padding;
  }
}
