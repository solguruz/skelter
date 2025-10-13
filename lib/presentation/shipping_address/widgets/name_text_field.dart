import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

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
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _fullNameController,
          decoration: InputDecoration(
            hintText: context.localization.enter_your_name,
            hintStyle: AppTextStyles.p3Medium.copyWith(
              color: AppColors.textNeutralDisable,
            ),
            errorText: fullNameErrorMessage.isNullOrEmpty()
                ? null
                : fullNameErrorMessage,
            errorStyle: AppTextStyles.p3Regular,
            errorMaxLines: 2,
            counterText: '',
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          maxLength: 50,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }
}
