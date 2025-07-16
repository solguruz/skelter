import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/validators/validators.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class SendResetLinkButton extends StatelessWidget {
  const SendResetLinkButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );
    final String email = context.select<LoginBloc, String>(
      (bloc) => bloc.state.emailPasswordLoginState?.email ?? '',
    );
    return AppButton(
      label: context.localization.login_signup_send_reset_link,
      fillWidth: true,
      size: AppButtonSize.l,
      state:
          email.isNotEmpty ? AppButtonState.d_efault : AppButtonState.disabled,
      showLoader: isLoading,
      onPressed: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        final String? emailError = isEmailValid(email, context);
        if (emailError != null) {
          context.loginBloc.add(EmailErrorEvent(errorMessage: emailError));
          return;
        }
        context.loginBloc.add(ForgotPasswordEvent());
      },
    );
  }
}
