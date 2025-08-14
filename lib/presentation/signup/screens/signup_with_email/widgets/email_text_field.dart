import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/signup/bloc/signup_bloc.dart';
import 'package:flutter_skeleton/presentation/signup/bloc/signup_event.dart';
import 'package:flutter_skeleton/utils/extensions/primitive_extensions.dart';
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
    final String? emailErrorMessage = context.select<SignupBloc, String?>(
      (bloc) => bloc.state.emailErrorMessage,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.login_signup_email,
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: context.localization.login_signup_email_hint,
            hintStyle: AppTextStyles.p3Medium.withColor(
              AppColors.textNeutralDisable,
            ),
            errorText:
                emailErrorMessage.isNullOrEmpty() ? null : emailErrorMessage,
            errorStyle: AppTextStyles.p3Regular,
            errorMaxLines: 2,
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  void _emailControllerListener() {
    final String? previousErrorMessage =
        context.read<SignupBloc>().state.emailErrorMessage;
    if (previousErrorMessage.haveContent()) {
      context.read<SignupBloc>().add(SignupEmailErrorEvent(errorMessage: ''));
    }
    context.read<SignupBloc>().add(
          SignupEmailChangeEvent(email: _emailController.text),
        );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
