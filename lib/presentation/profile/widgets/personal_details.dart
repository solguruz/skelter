import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            TablerIcons.user_circle,
            color: AppColors.iconNeutralDefault,
          ),
          title: Text(
            context.localization.personal_details,
            style: AppTextStyles.h6SemiBold,
          ),
          trailing: const Icon(
            TablerIcons.chevron_right,
            color: AppColors.iconNeutralDefault,
          ),
          onTap: () {
            context.showSnackBar('Show account details');
          },
        ),
      ],
    );
  }
}
