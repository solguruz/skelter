import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/extensions/app_button_size_extension.dart';
import 'package:flutter_skeleton/widgets/app_button/extensions/app_button_style_text_colors.dart';

class AppButtonLabel extends StatelessWidget {
  final String label;
  final AppButtonStyle style;
  final AppButtonSize size;
  final AppButtonState state;
  final Color? foregroundColor;
  final bool isLoading;

  const AppButtonLabel({
    super.key,
    required this.label,
    required this.style,
    required this.size,
    required this.state,
    this.foregroundColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: 1,
      style: size.textStyle.copyWith(
        color: isLoading
            ? Colors.transparent
            : foregroundColor ?? style.getTextColor(state),
        fontWeight: size.textStyle.fontWeight,
        height: 0,
        decoration:
            style == AppButtonStyle.link ? TextDecoration.underline : null,
      ),
    );
  }
}
