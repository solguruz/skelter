import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/app_icons/app_icon.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/widgets/app_button/icon_size.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

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

  /// use the values from [AppIcons]
  final String? appIcon;

  /// use the values from [TablerIcons]
  final IconData? iconData;

  /// use the values from [AppIcons]
  final String? leftAppIcon;

  /// use the values from [TablerIcons]
  final IconData? leftIconData;

  /// use the values from [AppIcons]
  final String? rightAppIcon;

  /// use the values from [TablerIcons]
  final IconData? rightIconData;

  /// Overrides
  final Color? iconOrTextColorOverride;
  final Color? bgColorOverride;
  final Color? borderColorOverride;
  final double? radiusOverride;

  /// `onPanDown` is faster than `onTap`
  /// because it is triggered when the user touches the screen.
  /// Avoid the usage if the button is part of a scrollable widget
  final bool shouldUseOnPanDown;
  final VoidCallback? onPressed;

  final bool showLoader;

  /// Adds vertical and horizontal padding to the button
  /// Otherwise the widget tends to take
  /// the full height of the AppBar for some reason
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
    this.iconOrTextColorOverride,
    this.bgColorOverride,
    this.borderColorOverride,
    this.showLoader = false,
    this.isAppBarAction = false,
    this.appBarActionVerticalPadding,
    this.appBarActionRightPadding,
    this.appBarActionLeftPadding,
    this.fillWidth = false,
    this.radiusOverride,
  })  : assert(
          (isIconButton && (appIcon != null || iconData != null)) ||
              (!isIconButton && (appIcon == null && iconData == null)),
          'icons or iconData should not be null and isIcon should be true',
        ),
        // assert(
        //   (!isIconButton) && label != null,
        //   'label should not be null.',
        // ),
        assert(
          (leftAppIcon == null &&
                  leftIconData == null &&
                  rightIconData == null &&
                  rightAppIcon == null) ||
              label != null,
          'The assert statement ensures that if any of the '
          'leftIcon, leftIconData, rightIcon, or rightIconData properties '
          'are not null, then the `label` property must also be not null',
        );

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
    assert(
      appIcon != null || iconData != null,
      'icons or iconData should not be null',
    );
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

    // Avoid using `Center` because it will take unlimited space
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
    return Row(
      children: [
        _icon(leftAppIcon, leftIconData),
        const Spacer(),
        _getText(),
        const Spacer(),
      ],
    );
  }

  Widget _buildWithRightIcon() {
    return Row(
      children: [
        const Spacer(),
        _getText(),
        const Spacer(),
        _icon(rightAppIcon, rightIconData),
      ],
    );
  }

/*  Widget _wrapIt(List<Widget> children) {
    return Wrap(
      spacing: size.gap,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children,
    );
  }*/

  Widget _buildTextButton() {
    return _getText();
  }

  // Common
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
    if (iconPath != null) {
      return AppIcon(
        iconPath: iconPath,
        color: _getTextColor(),
        size: size.iconSize,
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
