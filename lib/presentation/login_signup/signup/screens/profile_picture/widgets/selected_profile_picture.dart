import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class SelectedProfilePicture extends StatelessWidget {
  const SelectedProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    const profilePictureSize = 150.0;

    final File? profilePicture = context.select<LoginBloc, File?>(
      (bloc) => bloc.state.signupState?.selectedProfilePicture,
    );

    return profilePicture == null
        ? const SizedBox.shrink()
        : Container(
            padding: const EdgeInsets.all(4),
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
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.file(
                profilePicture,
                fit: BoxFit.cover,
                height: profilePictureSize,
                width: profilePictureSize,
              ),
            ),
          );
  }
}
