import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: const Icon(
          TablerIcons.trash,
          color: AppColors.bgErrorDefault,
        ),
        title: Text(
          context.localization.delete_account,
          style: AppTextStyles.p2Regular
              .copyWith(color: AppColors.textErrorSecondary),
        ),
        trailing: const Icon(
          TablerIcons.chevron_right,
          color: AppColors.iconNeutralDefault,
        ),
        onTap: () {
          context.router.push(const DeleteAccountRoute());
        },
      ),
    );
  }
}
