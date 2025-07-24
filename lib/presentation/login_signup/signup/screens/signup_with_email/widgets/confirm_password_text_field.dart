import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ConfirmPasswordTextField extends StatefulWidget {
  const ConfirmPasswordTextField({super.key});

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      _passwordControllerListener();
    });
  }

  void _passwordControllerListener() {
    //TODO: add a debouncer
    final String? previousErrorMessage = context
        .read<LoginBloc>()
        .state
        .signupState
        ?.confirmPasswordErrorMessage;
    if (previousErrorMessage.haveContent()) {
      context
          .read<LoginBloc>()
          .add(ConfirmPasswordErrorEvent(errorMessage: ''));
    }
    context.read<LoginBloc>().add(
          ConfirmPasswordChangeEvent(confirmPassword: _passwordController.text),
        );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPasswordVisible = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.signupState?.isConfirmPasswordVisible ?? false,
    );
    final String? passwordErrorMessage = context.select<LoginBloc, String?>(
      (bloc) => bloc.state.signupState?.confirmPasswordErrorMessage,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.login_signup_confirm_password,
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            hintText: context.localization.login_signup_confirm_password_hint,
            hintStyle: AppTextStyles.p3Medium.withColor(
              AppColors.textNeutralDisable,
            ),
            errorText: passwordErrorMessage.isNullOrEmpty()
                ? null
                : passwordErrorMessage,
            suffixIcon: IconButton(
              icon: Icon(
                size: 22,
                isPasswordVisible ? TablerIcons.eye_off : TablerIcons.eye,
                color: AppColors.strokeNeutralDisabled,
              ),
              onPressed: () {
                context.read<LoginBloc>().add(
                      ToggleConfirmPasswordVisibilityEvent(
                        isVisible: !isPasswordVisible,
                      ),
                    );
              },
            ),
          ),
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
