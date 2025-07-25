import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      _passwordControllerListener();
    });
  }

  void _passwordControllerListener() {
    // TODO: add a debouncer
    context.read<LoginBloc>().add(
          SignupPasswordChangeEvent(password: _passwordController.text),
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
      (bloc) => bloc.state.signupState?.isPasswordVisible ?? false,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.login_signup_password,
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            hintText: context.localization.login_signup_password_hint,
            suffixIcon: IconButton(
              icon: Icon(
                size: 22,
                isPasswordVisible ? TablerIcons.eye_off : TablerIcons.eye,
                color: AppColors.strokeNeutralDisabled,
              ),
              onPressed: () {
                context.read<LoginBloc>().add(
                      TogglePasswordVisibilityEvent(
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
