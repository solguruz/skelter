import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({super.key});

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  final TextEditingController _fullNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const fullNameErrorMessage = '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.name,
          style: AppTextStyles.p3Medium.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _fullNameController,
          decoration: InputDecoration(
            hintText: context.localization.enter_your_name,
            hintStyle: AppTextStyles.p3Medium.copyWith(
              color: context.currentTheme.textNeutralDisable,
            ),
            filled: true,
            fillColor: context.currentTheme.bgSurfaceBase2,
            errorText: fullNameErrorMessage.isNullOrEmpty()
                ? null
                : fullNameErrorMessage,
            errorStyle: AppTextStyles.p3Regular,
            errorMaxLines: 2,
            counterText: '',
            border: buildOutlineInputBorder(hasFocus: false),
            enabledBorder: buildOutlineInputBorder(hasFocus: false),
            focusedBorder: buildOutlineInputBorder(hasFocus: true),
            errorBorder: buildOutlineInputBorder(isErrorBorder: true),
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          maxLength: 50,
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder({
    bool? hasFocus,
    bool? isErrorBorder,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isErrorBorder ?? false
            ? context.currentTheme.strokeErrorDefault
            : hasFocus ?? false
                ? context.currentTheme.strokeBrandHover
                : context.currentTheme.strokeNeutralLight200,
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }
}
