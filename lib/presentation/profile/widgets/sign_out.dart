import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/profile/bloc/profile_bloc.dart';
import 'package:skelter/presentation/profile/bloc/profile_event.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.currentTheme.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Icon(
          TablerIcons.arrow_left_from_arc,
          color: AppColors.currentTheme.iconNeutralDefault,
        ),
        title: Text(
          context.localization.sign_out,
          style: AppTextStyles.h6SemiBold,
        ),
        trailing: Icon(
          TablerIcons.chevron_right,
          color: AppColors.currentTheme.iconNeutralDefault,
        ),
        onTap: () {
          context.read<ProfileBloc>().add(const SignOutEvent());
        },
      ),
    );
  }
}
