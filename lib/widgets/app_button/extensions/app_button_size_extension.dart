import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';

extension AppButtonSizeExtension on AppButtonSize {
  double get height => _heightMap[this]!;

  TextStyle get textStyle => _textStyleMap[this]!;

  EdgeInsets get padding => _paddingMap[this]!;

  double get spacing => _gapMap[this]!;

  double get iconSize => _iconSizeMap[this]!;

  static const _heightMap = {
    AppButtonSize.extraSmall: 30.0,
    AppButtonSize.small: 36.0,
    AppButtonSize.medium: 40.0,
    AppButtonSize.large: 46.0,
    AppButtonSize.extraLarge: 52.0,
  };

  static final _textStyleMap = {
    AppButtonSize.extraSmall: AppTextStyles.p4Medium,
    AppButtonSize.small: AppTextStyles.p3Medium,
    AppButtonSize.medium: AppTextStyles.p3Medium,
    AppButtonSize.large: AppTextStyles.p3Bold,
    AppButtonSize.extraLarge: AppTextStyles.p2Medium,
  };

  static const _paddingMap = {
    AppButtonSize.extraSmall: EdgeInsets.symmetric(horizontal: 14),
    AppButtonSize.small: EdgeInsets.symmetric(horizontal: 18),
    AppButtonSize.medium: EdgeInsets.symmetric(horizontal: 20),
    AppButtonSize.large: EdgeInsets.symmetric(horizontal: 22),
    AppButtonSize.extraLarge: EdgeInsets.symmetric(horizontal: 24),
  };

  static const _gapMap = {
    AppButtonSize.extraSmall: 6.0,
    AppButtonSize.small: 8.0,
    AppButtonSize.medium: 10.0,
    AppButtonSize.large: 10.0,
    AppButtonSize.extraLarge: 10.0,
  };

  static const _iconSizeMap = {
    AppButtonSize.extraSmall: 20.0,
    AppButtonSize.small: 20.0,
    AppButtonSize.medium: 20.0,
    AppButtonSize.large: 22.0,
    AppButtonSize.extraLarge: 24.0,
  };
}
