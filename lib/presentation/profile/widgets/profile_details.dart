import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/user_avatar.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                fullName,
                style: AppTextStyles.h6SemiBold,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                email,
                style: AppTextStyles.p3Medium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
