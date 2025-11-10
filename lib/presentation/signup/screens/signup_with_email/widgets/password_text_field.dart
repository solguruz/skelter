import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart';
import 'package:skelter/presentation/signup/bloc/signup_event.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

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
    _passwordController.text = context.read<SignupBloc>().state.password;
    _passwordController.addListener(() {
      _passwordControllerListener();
    });
  }

  void _passwordControllerListener() {
    // TODO: add a debouncer
    context.read<SignupBloc>().add(
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
    final bool isPasswordVisible = context.select<SignupBloc, bool>(
      (bloc) => bloc.state.isPasswordVisible,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.password,
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 8),
        ClarityMask(
          child: TextField(
            controller: _passwordController,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              hintText: context.localization.password_hint,
              suffixIcon: IconButton(
                icon: Icon(
                  size: 22,
                  isPasswordVisible ? TablerIcons.eye_off : TablerIcons.eye,
                  color: AppColors.strokeNeutralDisabled,
                ),
                onPressed: () {
                  context.read<SignupBloc>().add(
                        TogglePasswordVisibilityEvent(
                          isVisible: !isPasswordVisible,
                        ),
                      );
                },
              ),
            ),
            textInputAction: TextInputAction.done,
          ),
        ),
      ],
    );
  }
}
