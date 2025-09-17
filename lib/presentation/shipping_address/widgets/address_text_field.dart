import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class AddressTextField extends StatefulWidget {
  const AddressTextField({super.key});

  @override
  State<AddressTextField> createState() => _AddressTextFieldState();
}

class _AddressTextFieldState extends State<AddressTextField> {
  final TextEditingController _addressTextController = TextEditingController();

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
          context.localization.address,
          style: AppTextStyles.p3Medium.copyWith(
            color: AppColors.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _addressTextController,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.currentTheme.bgSurfaceBase2,
            hintText: context.localization.enter_your_address,
            hintStyle: AppTextStyles.p3Medium.copyWith(
              color: AppColors.currentTheme.textNeutralDisable,
            ),
            errorStyle: AppTextStyles.p3Regular,
            errorMaxLines: 2,
            counterText: '',
            suffix: Text(
              '${_addressTextController.text.length}/250',
              style: AppTextStyles.p3Regular.copyWith(
                color: AppColors.currentTheme.textNeutralDisable,
              ),
            ),
            counterStyle: AppTextStyles.p3Regular.copyWith(
              color: AppColors.currentTheme.textNeutralDisable,
            ),
            border: buildOutlineInputBorder(hasFocus: false),
            enabledBorder: buildOutlineInputBorder(hasFocus: false),
            focusedBorder: buildOutlineInputBorder(hasFocus: true),
            errorBorder: buildOutlineInputBorder(isErrorBorder: true),
          ),
          textInputAction: TextInputAction.newline,
          maxLength: 250,
          keyboardType: TextInputType.multiline,
          minLines: 3,
          maxLines: 5,
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
            ? AppColors.currentTheme.strokeErrorDefault
            : hasFocus ?? false
                ? AppColors.currentTheme.strokeBrandHover
                : AppColors.currentTheme.strokeNeutralLight200,
      ),
    );
  }

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }
}
