import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/profile_picture/widgets/add_skip_picture_button.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );
    return SizedBox(
      width: context.screenWidth / 2,
      child: AppButton(
        label: context.l10n.login_signup_edit,
        size: AppButtonSize.xl,
        style: AppButtonStyle.outline,
        fillWidth: true,
        state: isLoading ? AppButtonState.disabled : AppButtonState.d_efault,
        onPressed: () {
          if (!isLoading) {
            AddSkipPictureButton.showImageSourceBottomSheet(
              context,
              showRemoveImageButton: true,
              onImageSelected: (File file) {
                context.loginBloc.add(SelectedProfilePictureEvent(image: file));
                context.loginBloc
                    .add(ProfilePictureDoneToggleEvent(isDoneEditing: true));
              },
              onImageRemoved: () {
                context.loginBloc.add(RemoveProfilePictureEvent());
                context.loginBloc
                    .add(ProfilePictureDoneToggleEvent(isDoneEditing: false));
              },
            );
          }
        },
      ),
    );
  }
}
