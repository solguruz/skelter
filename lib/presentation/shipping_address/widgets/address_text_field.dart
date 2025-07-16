import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

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
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _addressTextController,
          decoration: InputDecoration(
            hintText: context.localization.enter_your_address,
            hintStyle: AppTextStyles.p3Medium.withColor(
              AppColors.textNeutralDisable,
            ),
            errorStyle: AppTextStyles.p3Regular,
            errorMaxLines: 2,
            counterText: '',
            suffix: Text(
              '${_addressTextController.text.length}/250',
              style: AppTextStyles.p3Regular.withColor(
                AppColors.textNeutralDisable,
              ),
            ),
            counterStyle: AppTextStyles.p3Regular.withColor(
              AppColors.textNeutralDisable,
            ),
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

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }
}
