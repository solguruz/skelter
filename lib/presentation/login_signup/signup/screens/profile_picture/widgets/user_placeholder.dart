import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/profile_picture/widgets/add_skip_picture_button.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class UserPlaceholder extends StatelessWidget {
  const UserPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AddSkipPictureButton.showImageSourceBottomSheet(
        context,
        onImageSelected: (File file) {
          context
              .read<LoginBloc>()
              .add(SelectedProfilePictureEvent(image: file));
          context
              .read<LoginBloc>()
              .add(ProfilePictureDoneToggleEvent(isDoneEditing: true));
        },
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.shadowColor,
              offset: Offset(0, 4),
              spreadRadius: -2,
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(Assets.icons.userPlaceholder),
        ),
      ),
    );
  }
}
