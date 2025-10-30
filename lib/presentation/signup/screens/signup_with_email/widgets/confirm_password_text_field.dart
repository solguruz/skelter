import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart';
import 'package:skelter/presentation/signup/bloc/signup_event.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ConfirmPasswordTextField extends StatefulWidget {
  const ConfirmPasswordTextField({super.key});

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  final TextEditingController _passwordController = TextEditingController();
  final Debouncer<String> _debouncer =
      Debouncer<String>(const Duration(milliseconds: 500), initialValue: '');

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      _passwordControllerListener();
    });
  }

  void _passwordControllerListener() {
    _debouncer.value = _passwordController.text;
    final String? previousErrorMessage =
        context.read<SignupBloc>().state.confirmPasswordErrorMessage;
    if (previousErrorMessage.haveContent()) {
      context
          .read<SignupBloc>()
          .add(ConfirmPasswordErrorEvent(errorMessage: ''));
    }

    _debouncer.values.listen((text) {
      context.read<SignupBloc>().add(
            ConfirmPasswordChangeEvent(
              confirmPassword: _passwordController.text,
            ),
          );
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _debouncer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPasswordVisible = context.select<SignupBloc, bool>(
      (bloc) => bloc.state.isConfirmPasswordVisible,
    );
    final String? passwordErrorMessage = context.select<SignupBloc, String?>(
      (bloc) => bloc.state.confirmPasswordErrorMessage,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.confirm_password,
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 8),
        ClarityMask(
          child: TextField(
            controller: _passwordController,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              hintText: context.localization.confirm_password_hint,
              hintStyle: AppTextStyles.p3Medium.copyWith(
                color: AppColors.textNeutralDisable,
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
                  context.read<SignupBloc>().add(
                        ToggleConfirmPasswordVisibilityEvent(
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
