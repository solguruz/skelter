import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        TablerIcons.headphones,
        color: AppColors.iconNeutralDefault,
      ),
      title: Text(
        context.localization.contact_us,
        style: AppTextStyles.h6SemiBold,
      ),
      trailing: const Icon(
        TablerIcons.chevron_right,
        color: AppColors.iconNeutralDefault,
      ),
      onTap: () {
        context.router.push(const ContactUsRoute());
      },
    );
  }
}
