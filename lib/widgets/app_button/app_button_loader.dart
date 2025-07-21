import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/extensions/app_button_size_extension.dart';
import 'package:flutter_skeleton/widgets/app_button/extensions/app_button_style_text_colors.dart';

class AppButtonLoader extends StatelessWidget {
  final AppButtonStyle style;
  final AppButtonState state;
  final AppButtonSize size;

  const AppButtonLoader({
    super.key,
    required this.style,
    required this.state,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final loaderSize = (size.textStyle.fontSize ?? 10) * 1.5;
    return SizedBox(
      height: loaderSize,
      width: loaderSize,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation(style.getTextColor(state)),
      ),
    );
  }
}
