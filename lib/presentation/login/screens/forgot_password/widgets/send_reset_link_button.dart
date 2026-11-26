import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/validators/validators.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_state_enum.dart';

class SendResetLinkButton extends StatelessWidget {
  const SendResetLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );
    final String email = context.select<LoginBloc, String>(
      (bloc) => bloc.state.emailPasswordLoginState?.email ?? '',
    );
    return AppButton(
      label: context.localization.send_reset_link,
      foregroundColor: context.currentTheme.textNeutralLight,
      shouldSetFullWidth: true,
      size: AppButtonSize.large,
      state: email.isNotEmpty ? AppButtonState.normal : AppButtonState.disabled,
      isLoading: isLoading,
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        final String? emailError = isEmailValid(email, context);
        if (emailError != null) {
          context.read<LoginBloc>().add(
            EmailErrorEvent(errorMessage: emailError),
          );
          return;
        }
        context.read<LoginBloc>().add(ForgotPasswordEvent());
      },
    );
  }
}
