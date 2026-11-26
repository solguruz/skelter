import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/feedback/bloc/feedback_bloc.dart';
import 'package:skelter/presentation/feedback/bloc/feedback_event.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_state_enum.dart';

class FeedbackSubmitButton extends StatelessWidget {
  const FeedbackSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.select<FeedbackBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: AppButton(
          label: context.localization.submit_feedback,
          foregroundColor: context.currentTheme.textNeutralLight,
          shouldSetFullWidth: true,
          size: AppButtonSize.extraLarge,
          isLoading: isLoading,
          state: isLoading ? AppButtonState.disabled : AppButtonState.normal,
          onPressed: isLoading
              ? null
              : () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  final user = FirebaseAuth.instance.currentUser;
                  context.read<FeedbackBloc>().add(
                    FeedbackSubmittedEvent(
                      userId: user?.uid ?? '',
                      name: user?.displayName ?? '',
                      email: user?.email ?? '',
                      phoneNumber: user?.phoneNumber ?? '',
                    ),
                  );
                },
        ),
      ),
    );
  }
}
