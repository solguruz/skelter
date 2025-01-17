import 'dart:io';

import 'package:flutter_skeleton/analytics/analytics_events.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/analytics_helper.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/profile_picture/widgets/image_source_bottom_sheet_body.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSkipPictureCTA extends StatelessWidget {
  const AddSkipPictureCTA({super.key});

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
            AnalyticsHelper().logCustomEvent(
              DebugSignUpAnalyticsEvents.kTapAddSignupProfilePicture,
            );
            if (!isLoading) {
              showImageSourceBottomSheet(
                context,
                onImageSelected: (File file) {
                  AnalyticsHelper().logCustomEvent(
                    DebugSignUpAnalyticsEvents.kTapSignupProfilePictureSelected,
                  );
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
            AnalyticsHelper().logCustomEvent(
              DebugSignUpAnalyticsEvents.kTapSkipSignupProfilePicture,
            );
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
