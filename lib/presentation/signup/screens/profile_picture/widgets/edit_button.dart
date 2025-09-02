import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/signup/screens/profile_picture/widgets/add_skip_picture_button.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: AppButton(
        label: context.localization.edit,
        size: AppButtonSize.extraLarge,
        style: AppButtonStyle.outline,
        shouldSetFullWidth: true,
        state: isLoading ? AppButtonState.disabled : AppButtonState.normal,
        onPressed: () {
          if (!isLoading) {
            AddSkipPictureButton.showImageSourceBottomSheet(
              context,
              showRemoveImageButton: true,
              onImageSelected: (File file) {
                context
                    .read<LoginBloc>()
                    .add(SelectedProfilePictureEvent(image: file));
                context
                    .read<LoginBloc>()
                    .add(ProfilePictureDoneToggleEvent(isDoneEditing: true));
              },
              onImageRemoved: () {
                context.read<LoginBloc>().add(RemoveProfilePictureEvent());
                context
                    .read<LoginBloc>()
                    .add(ProfilePictureDoneToggleEvent(isDoneEditing: false));
              },
            );
          }
        },
      ),
    );
  }
}
