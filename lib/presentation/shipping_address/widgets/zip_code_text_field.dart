import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class ZipCodeTextField extends StatefulWidget {
  const ZipCodeTextField({super.key});

  @override
  State<ZipCodeTextField> createState() => _ZipCodeTextFieldState();
}

class _ZipCodeTextFieldState extends State<ZipCodeTextField> {
  final TextEditingController _zipCodeTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.zip_code,
          style: AppTextStyles.p3Medium.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _zipCodeTextController,
          decoration: InputDecoration(
            filled: true,
            fillColor: context.currentTheme.bgSurfaceBase2,
            hintText: context.localization.enter_zip_code,
            hintStyle: AppTextStyles.p3Medium.copyWith(
              color: context.currentTheme.textNeutralDisable,
            ),
            border: buildOutlineInputBorder(hasFocus: false),
            enabledBorder: buildOutlineInputBorder(hasFocus: false),
            focusedBorder: buildOutlineInputBorder(hasFocus: true),
            errorBorder: buildOutlineInputBorder(isErrorBorder: true),
            errorStyle: AppTextStyles.p3Regular,
            errorMaxLines: 2,
            counterText: '',
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
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
    _zipCodeTextController.dispose();
    super.dispose();
  }
}
