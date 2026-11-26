import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/presentation/profile/bloc/profile_bloc.dart';
import 'package:skelter/presentation/profile/widgets/user_avatar.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final String fullName = context.select<ProfileBloc, String>(
      (bloc) => bloc.state.name,
    );
    final String email = context.select<ProfileBloc, String>(
      (bloc) => bloc.state.email,
    );

    return Row(
      children: [
        const UserAvatar(),
        const SizedBox(width: 24.0),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Text(
                fullName,
                style: AppTextStyles.h6SemiBold.copyWith(
                  color: context.currentTheme.textNeutralPrimary,
                ),
                overflow: .ellipsis,
                maxLines: 1,
              ),
              Text(
                email,
                style: AppTextStyles.p3Medium.copyWith(
                  color: context.currentTheme.textNeutralSecondary,
                ),
                overflow: .ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
