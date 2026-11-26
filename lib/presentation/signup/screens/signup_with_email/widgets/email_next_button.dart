import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/constants/integration_test_keys.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart';
import 'package:skelter/presentation/signup/bloc/signup_event.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/validators/validators.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_state_enum.dart';

class EmailNextButton extends StatelessWidget {
  const EmailNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.select<SignupBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );
    final String email = context.select<SignupBloc, String>(
      (bloc) => bloc.state.email,
    );

    return AppButton(
      key: keys.signupPage.signupEmailNextButton,
      label: context.localization.next,
      foregroundColor: context.currentTheme.textNeutralLight,
      shouldSetFullWidth: true,
      size: AppButtonSize.large,
      state: email.isNotEmpty ? AppButtonState.normal : AppButtonState.disabled,
      isLoading: isLoading,
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        final String? emailError = isEmailValid(email, context);
        if (emailError != null) {
          context.read<SignupBloc>().add(
            SignupEmailErrorEvent(errorMessage: emailError),
          );
          return;
        }
        context.read<SignupBloc>().add(
          CheckEmailAvailabilityEvent(email: email),
        );
      },
    );
  }
}
