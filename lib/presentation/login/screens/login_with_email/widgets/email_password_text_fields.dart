import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/constants/integration_test_keys.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/bloc/login_state.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class EmailPasswordTextFields extends StatefulWidget {
  const EmailPasswordTextFields({super.key});

  @override
  State<EmailPasswordTextFields> createState() =>
      _EmailPasswordTextFieldsState();
}

class _EmailPasswordTextFieldsState extends State<EmailPasswordTextFields> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final emailPasswordLoginState =
        context.read<LoginBloc>().state.emailPasswordLoginState;

    _emailController.text = emailPasswordLoginState?.email ?? '';
    _passwordController.text = emailPasswordLoginState?.password ?? '';
    _emailController.addListener(() {
      _emailControllerListener();
    });

    _passwordController.addListener(() {
      _passwordControllerListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isPasswordVisible = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.emailPasswordLoginState?.isPasswordVisible ?? false,
    );
    final String? emailErrorMessage = context.select<LoginBloc, String?>(
      (bloc) => bloc.state.emailPasswordLoginState?.emailErrorMessage,
    );
    final String? passwordErrorMessage = context.select<LoginBloc, String?>(
      (bloc) => bloc.state.emailPasswordLoginState?.passwordErrorMessage,
    );
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is ClearLoginWithEmailControllerState) {
          _emailController.clear();
          _passwordController.clear();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localization.email,
            style: AppTextStyles.p3Medium
                .copyWith(color: context.currentTheme.textNeutralPrimary),
          ),
          const SizedBox(height: 16),
          ClarityMask(
            child: TextField(
              key: keys.signInPage.emailTextField,
              controller: _emailController,
              style: AppTextStyles.p3Medium
                  .copyWith(color: context.currentTheme.textNeutralPrimary),
              decoration: InputDecoration(
                hintText: context.localization.email_hint,
                hintStyle: AppTextStyles.p3Medium.copyWith(
                  color: context.currentTheme.textNeutralDisable,
                ),
                filled: true,
                fillColor: context.currentTheme.bgSurfaceBase2,
                errorText: emailErrorMessage.isNullOrEmpty()
                    ? null
                    : emailErrorMessage,
                border: buildOutlineInputBorder(hasFocus: false),
                enabledBorder: buildOutlineInputBorder(hasFocus: false),
                focusedBorder: buildOutlineInputBorder(hasFocus: true),
                errorBorder: buildOutlineInputBorder(isErrorBorder: true),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.localization.password,
            style: AppTextStyles.p3Medium,
          ),
          const SizedBox(height: 8),
          ClarityMask(
            child: TextField(
              key: keys.signInPage.passwordTextField,
              controller: _passwordController,
              obscureText: !isPasswordVisible,
              style: AppTextStyles.p3Medium
                  .copyWith(color: context.currentTheme.textNeutralPrimary),
              decoration: InputDecoration(
                hintText: context.localization.password_hint,
                hintStyle: AppTextStyles.p3Medium.copyWith(
                  color: context.currentTheme.textNeutralDisable,
                ),
                filled: true,
                fillColor: context.currentTheme.bgSurfaceBase2,
                border: buildOutlineInputBorder(hasFocus: false),
                enabledBorder: buildOutlineInputBorder(hasFocus: false),
                focusedBorder: buildOutlineInputBorder(hasFocus: true),
                errorBorder: buildOutlineInputBorder(isErrorBorder: true),
                errorText: passwordErrorMessage.isNullOrEmpty()
                    ? null
                    : passwordErrorMessage,
                suffixIcon: IconButton(
                  icon: Icon(
                    size: 22,
                    isPasswordVisible ? TablerIcons.eye_off : TablerIcons.eye,
                    color: context.currentTheme.strokeNeutralDisabled,
                  ),
                  onPressed: () {
                    context.read<LoginBloc>().add(
                          IsPasswordVisibleEvent(
                            isPasswordVisible: !isPasswordVisible,
                          ),
                        );
                  },
                ),
              ),
              textInputAction: TextInputAction.done,
            ),
          ),
        ],
      ),
    );
  }

  void _emailControllerListener() {
    final String? previousErrorMessage = context
        .read<LoginBloc>()
        .state
        .emailPasswordLoginState
        ?.emailErrorMessage;
    if (previousErrorMessage.haveContent()) {
      context.read<LoginBloc>().add(EmailErrorEvent(errorMessage: ''));
    }
    context.read<LoginBloc>().add(
          EmailChangeEvent(email: _emailController.text),
        );
  }

  void _passwordControllerListener() {
    final String? previousErrorMessage = context
        .read<LoginBloc>()
        .state
        .emailPasswordLoginState
        ?.passwordErrorMessage;
    if (previousErrorMessage.haveContent()) {
      context.read<LoginBloc>().add(PasswordErrorEvent(errorMessage: ''));
    }
    context.read<LoginBloc>().add(
          PasswordChangeEvent(password: _passwordController.text),
        );
  }

  OutlineInputBorder buildOutlineInputBorder({
    bool? hasFocus,
    bool? isErrorBorder,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isErrorBorder ?? false
            ? context.currentTheme.strokeErrorDefault
            : hasFocus ?? false
                ? context.currentTheme.strokeBrandHover
                : context.currentTheme.strokeNeutralLight200,
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
