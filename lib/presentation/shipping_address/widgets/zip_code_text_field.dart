import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

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
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _zipCodeTextController,
          decoration: InputDecoration(
            hintText: context.localization.enter_zip_code,
            hintStyle: AppTextStyles.p3Medium.withColor(
              AppColors.textNeutralDisable,
            ),
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

  @override
  void dispose() {
    _zipCodeTextController.dispose();
    super.dispose();
  }
}
