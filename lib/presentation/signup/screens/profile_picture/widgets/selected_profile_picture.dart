import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class SelectedProfilePicture extends StatelessWidget {
  const SelectedProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    const profilePictureSize = 150.0;

    final File? profilePicture = context.select<SignupBloc, File?>(
      (bloc) => bloc.state.selectedProfilePicture,
    );

    return profilePicture == null
        ? const SizedBox.shrink()
        : Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: .circle,
              color: context.currentTheme.strokeShadesWhite,
              boxShadow: <BoxShadow>[
                const BoxShadow(
                  color: AppColors.shadowColor,
                  offset: Offset(0, 4),
                  spreadRadius: -2,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Container(
              clipBehavior: .hardEdge,
              decoration: const BoxDecoration(shape: .circle),
              child: AppEnvironment.isTestEnvironment
                  ? Image.asset(
                      profilePicture.path,
                      fit: .cover,
                      height: profilePictureSize,
                      width: profilePictureSize,
                    )
                  : Image.file(
                      profilePicture,
                      fit: .cover,
                      height: profilePictureSize,
                      width: profilePictureSize,
                    ),
            ),
          );
  }
}
