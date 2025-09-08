import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ContactUsDescription extends StatelessWidget {
  const ContactUsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localization.contact_us_message,
      style:
          AppTextStyles.p2Regular.copyWith(color: AppColors.textNeutralPrimary),
    );
  }
}
