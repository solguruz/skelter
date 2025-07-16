import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/widgets/app_button/icon_size.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'app_button_size.dart';
part 'app_button_state.dart';
part 'app_button_style.dart';

class AppButton extends StatelessWidget {
  final AppButtonStyle style;
  final AppButtonSize size;
  final AppButtonState state;
  final bool isDestructive;
  final String? label;
  final bool isIconButton;
  final String? appIcon;
  final IconData? iconData;
  final String? leftAppIcon;
  final IconData? leftIconData;
  final String? rightAppIcon;
  final IconData? rightIconData;
  final bool leftAppIconAttachedToText;
  final bool rightAppIconAttachedToText;
  final Color? iconOrTextColorOverride;
  final Color? bgColorOverride;
  final Color? borderColorOverride;
  final double? radiusOverride;
  final bool shouldUseOnPanDown;
  final VoidCallback? onPressed;
  final bool showLoader;
  final bool isAppBarAction;
  final double? appBarActionVerticalPadding;
  final double? appBarActionRightPadding;
  final double? appBarActionLeftPadding;
  final bool fillWidth;

  const AppButton({
    super.key,
    this.style = AppButtonStyle.primary,
    this.size = AppButtonSize.s,
    this.state = AppButtonState.d_efault,
    this.isDestructive = false,
    this.isIconButton = false,
    this.onPressed,
    this.shouldUseOnPanDown = false,
    this.appIcon,
    this.iconData,
    this.label,
    this.leftAppIcon,
    this.leftIconData,
    this.rightAppIcon,
    this.rightIconData,
    this.leftAppIconAttachedToText = false,
    this.rightAppIconAttachedToText = false,
    this.iconOrTextColorOverride,
    this.bgColorOverride,
    this.borderColorOverride,
    this.showLoader = false,
    this.isAppBarAction = false,
    this.appBarActionRightPadding,
    this.appBarActionLeftPadding,
    this.appBarActionVerticalPadding,
    this.fillWidth = false,
    this.radiusOverride,
  });

  factory AppButton.icon({
    String? appIcon,
    IconData? iconData,
    AppButtonSize? size,
    AppButtonState? state,
    required VoidCallback onPressed,
    bool shouldUseOnPanDown = false,
    Color? iconOrTextColorOverride = AppColors.iconNeutralDefault,
    bool isAppBarAction = false,
    double? appBarActionRightPadding,
  }) {
    return AppButton(
      style: AppButtonStyle.textOrIcon,
      size: size ?? AppButtonSize.s,
      state: state ?? AppButtonState.d_efault,
      iconData: iconData,
      isIconButton: true,
      appIcon: appIcon,
      onPressed: onPressed,
      shouldUseOnPanDown: shouldUseOnPanDown,
      iconOrTextColorOverride: iconOrTextColorOverride,
      isAppBarAction: isAppBarAction,
      appBarActionRightPadding: appBarActionRightPadding,
    );
  }

  factory AppButton.primary({
    required String label,
    AppButtonSize? size,
    AppButtonState? state,
    required VoidCallback onPressed,
    bool shouldUseOnPanDown = false,
    Color? iconOrTextColorOverride,
    bool isAppBarAction = false,
    bool? showLoader,
    double? radiusOverride,
  }) {
    return AppButton(
      size: size ?? AppButtonSize.s,
      state: state ?? AppButtonState.d_efault,
      label: label,
      onPressed: onPressed,
      shouldUseOnPanDown: shouldUseOnPanDown,
      iconOrTextColorOverride: iconOrTextColorOverride,
      isAppBarAction: isAppBarAction,
      showLoader: showLoader ?? false,
      radiusOverride: radiusOverride,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isIconButton) {
      child = _icon(appIcon, iconData);
    } else if ((leftAppIcon != null || leftIconData != null) &&
        (rightAppIcon != null || rightIconData != null)) {
      child = _buttonWithLeftAndRightIcon();
    } else if (leftAppIcon != null || leftIconData != null) {
      child = _buildWithLeftIcon();
    } else if (rightAppIcon != null || rightIconData != null) {
      child = _buildWithRightIcon();
    } else {
      child = _buildTextButton();
    }

    final Widget centeredChild = Stack(
      alignment: Alignment.center,
      children: [child, if (showLoader) _loader()],
    );

    final Widget widget = InkWell(
      splashFactory: NoSplash.splashFactory,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      onTapDown: shouldUseOnPanDown
          ? (_) {
              onPressed?.call();
            }
          : null,
      onTap: !shouldUseOnPanDown ? onPressed : null,
      child: Container(
        height: size.height,
        width: isIconButton
            ? size.height
            : fillWidth
                ? double.infinity
                : null,
        padding: _padding(),
        decoration: style.decoration(
          state,
          isDestructive: isDestructive,
          bgColorOverride: bgColorOverride,
          borderColorOverride: borderColorOverride,
          radiusOverride: radiusOverride,
        ),
        child: centeredChild,
      ),
    );

    if (isAppBarAction) {
      return Padding(
        padding: EdgeInsets.only(
          right: appBarActionRightPadding ?? 16,
          left: appBarActionRightPadding ?? 0,
          top: appBarActionVerticalPadding ?? 13,
          bottom: appBarActionVerticalPadding ?? 13,
        ),
        child: widget,
      );
    } else {
      return widget;
    }
  }

  Widget _loader() {
    return CupertinoActivityIndicator(
      color: style.getTextColor(state, isDestructive: isDestructive),
      radius: (size.textStyle.fontSize ?? 10) * 0.6,
    );
  }

  Widget _buttonWithLeftAndRightIcon() {
    return Row(
      children: [
        _icon(leftAppIcon, leftIconData),
        const Spacer(),
        _getText(),
        const Spacer(),
        _icon(rightAppIcon, rightIconData),
      ],
    );
  }

  Widget _buildWithLeftIcon() {
    if (leftAppIconAttachedToText) {
      return Row(
        children: [
          const Spacer(),
          _icon(leftAppIcon, leftIconData),
          SizedBox(width: size.gap),
          _getText(),
          const Spacer(),
        ],
      );
    } else {
      return Row(
        children: [
          _icon(leftAppIcon, leftIconData),
          const Spacer(),
          SizedBox(width: size.gap),
          _getText(),
          const Spacer(),
        ],
      );
    }
  }

  Widget _buildWithRightIcon() {
    if (rightAppIconAttachedToText) {
      return Row(
        children: [
          const Spacer(),
          _getText(),
          SizedBox(width: size.gap),
          Flexible(child: _icon(rightAppIcon, rightIconData)),
          const Spacer(),
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          _getText(),
          const Spacer(),
          _icon(rightAppIcon, rightIconData),
        ],
      );
    }
  }

  Widget _buildTextButton() {
    return _getText();
  }

  Text _getText() {
    return Text(
      label!,
      style: size.textStyle.copyWith(
        color: _getTextColor(),
        fontWeight: _getFontWeight(),
        height: 0,
        decoration:
            style == AppButtonStyle.link ? TextDecoration.underline : null,
      ),
      maxLines: 1,
    );
  }

  Widget _icon(String? iconPath, IconData? iconData) {
    if (iconPath != null && iconPath.endsWith(kSVGExtension)) {
      return SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(_getTextColor(), BlendMode.srcIn),
        height: size.iconSize,
        width: size.iconSize,
      );
    } else if ((iconPath ?? '').endsWith(kPNGExtension)) {
      return Image.asset(
        iconPath ?? '',
        height: size.iconSize,
        width: size.iconSize,
      );
    } else if (iconData != null) {
      return Icon(
        iconData,
        color: _getTextColor(),
        size: size.iconSize * 0.9,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Color _getTextColor() {
    if (iconOrTextColorOverride != null) {
      return iconOrTextColorOverride!;
    }
    if (showLoader) {
      return AppColors.transparent;
    } else {
      return style.getTextColor(state, isDestructive: isDestructive);
    }
  }

  FontWeight? _getFontWeight() {
    return size.textStyle.fontWeight;
  }

  EdgeInsets? _padding() {
    if (isIconButton) {
      return EdgeInsets.zero;
    }
    switch (style) {
      case AppButtonStyle.primary:
      case AppButtonStyle.secondary:
      case AppButtonStyle.outline:
        return size.padding;
      case AppButtonStyle.link:
      case AppButtonStyle.textOrIcon:
        return EdgeInsets.zero;
    }
  }
}
