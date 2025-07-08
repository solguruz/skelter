import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/profile_picture/widgets/image_source_bottom_sheet_body.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class AddSkipPictureButton extends StatelessWidget {
  const AddSkipPictureButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );
    return Column(
      children: [
        AppButton(
          label: context.l10n.login_signup_add,
          fillWidth: true,
          size: AppButtonSize.l,
          state: isLoading ? AppButtonState.disabled : AppButtonState.d_efault,
          onPressed: () {
            if (!isLoading) {
              showImageSourceBottomSheet(
                context,
                onImageSelected: (File file) {
                  context.loginBloc
                      .add(SelectedProfilePictureEvent(image: file));
                  context.loginBloc
                      .add(ProfilePictureDoneToggleEvent(isDoneEditing: true));
                },
              );
            }
          },
        ),
        const SizedBox(height: 16),
        AppButton(
          label: context.l10n.login_signup_skip,
          fillWidth: true,
          size: AppButtonSize.l,
          style: AppButtonStyle.outline,
          showLoader: isLoading,
          onPressed: () {
            context.loginBloc.add(FinishProfilePictureEvent());
          },
        ),
      ],
    );
  }

  static Future<void> showImageSourceBottomSheet(
    BuildContext context, {
    required Function(File file) onImageSelected,
    bool? showRemoveImageButton,
    Function()? onImageRemoved,
  }) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (_) => ImageSourceBottomSheetBody(
        onImageSelected: onImageSelected,
        showRemoveImageButton: showRemoveImageButton,
        onImageRemoved: onImageRemoved,
      ),
    );
  }
}
