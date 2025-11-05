import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

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
    _emailController.text =
        context.read<LoginBloc>().state.emailPasswordLoginState?.email ?? '';
    _emailController.addListener(() {
      _emailControllerListener();
    });
  }

  void _emailControllerListener() {
    final String? previousError = context
        .read<LoginBloc>()
        .state
        .emailPasswordLoginState
        ?.emailErrorMessage;
    if (previousError != null && previousError.isNotEmpty) {
      context.read<LoginBloc>().add(EmailErrorEvent(errorMessage: ''));
    }
    context.read<LoginBloc>().add(
          EmailChangeEvent(email: _emailController.text),
        );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? emailError = context.select<LoginBloc, String?>(
      (bloc) => bloc.state.emailPasswordLoginState?.emailErrorMessage,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.email,
          style: AppTextStyles.p3Medium
              .copyWith(color: context.currentTheme.textNeutralPrimary),
        ),
        const SizedBox(height: 8),
        ClarityMask(
          child: TextField(
            controller: _emailController,
            style: AppTextStyles.p3Medium.copyWith(
              color: context.currentTheme.textNeutralPrimary,
            ),
            decoration: InputDecoration(
              hintText: context.localization.email_hint,
              hintStyle: AppTextStyles.p3Medium.copyWith(
                color: context.currentTheme.textNeutralDisable,
              ),
              border: buildOutlineInputBorder(hasFocus: false),
              enabledBorder: buildOutlineInputBorder(hasFocus: false),
              focusedBorder: buildOutlineInputBorder(hasFocus: true),
              errorBorder: buildOutlineInputBorder(isErrorBorder: true),
              filled: true,
              fillColor: context.currentTheme.bgSurfaceBase2,
              errorText: emailError != null && emailError.isNotEmpty
                  ? emailError
                  : null,
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
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
}
