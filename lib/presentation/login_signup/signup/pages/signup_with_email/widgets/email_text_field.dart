import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/constants/login_signup_constants.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({super.key});

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      _emailControllerListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    final String? emailErrorMessage = context.select<LoginBloc, String?>(
      (bloc) => bloc.state.signupState?.emailErrorMessage,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.login_signup_email,
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 16),
        TextField(
          key: kEmailKey,
          controller: _emailController,
          decoration: InputDecoration(
            hintText: context.l10n.login_signup_email_hint,
            hintStyle: AppTextStyles.p3Medium.withColor(
              AppColors.textNeutralDisable,
            ),
            errorText:
                emailErrorMessage.isNullOrEmpty() ? null : emailErrorMessage,
            errorStyle: AppTextStyles.p3Regular,
            errorMaxLines: 2,
            border: _enabledInputBorder(),
            enabledBorder: _enabledInputBorder(),
            focusedBorder: _focusedInputBorder(),
            errorBorder: _errorInputBorder(),
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  void _emailControllerListener() {
    // TODO: add a debouncer
    final String? previousErrorMessage =
        context.loginBloc.state.signupState?.emailErrorMessage;
    if (previousErrorMessage.haveContent()) {
      context.loginBloc.add(SignupEmailErrorEvent(errorMessage: ''));
    }
    context.loginBloc.add(
      SignupEmailChangeEvent(email: _emailController.text),
    );
  }

  OutlineInputBorder _enabledInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.strokeNeutralLight200),
      borderRadius: BorderRadius.circular(8),
    );
  }

  OutlineInputBorder _focusedInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.strokeBrandHover),
      borderRadius: BorderRadius.circular(8),
    );
  }

  OutlineInputBorder _errorInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.strokeErrorDefault),
      borderRadius: BorderRadius.circular(8),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
