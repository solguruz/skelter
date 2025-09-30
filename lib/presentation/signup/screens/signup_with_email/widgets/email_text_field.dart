import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart';
import 'package:skelter/presentation/signup/bloc/signup_event.dart';
import 'package:skelter/utils/extensions/string.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({super.key});

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final TextEditingController _emailController = TextEditingController();
  final Debouncer<String> _debouncer =
      Debouncer<String>(const Duration(milliseconds: 300), initialValue: '');

  @override
  void initState() {
    super.initState();

    _emailController.text = context.read<SignupBloc>().state.email;

    _emailController.addListener(() {
      _debouncer.value = _emailController.text;
    });

    _debouncer.values.listen((email) {
      final previousErrorMessage =
          context.read<SignupBloc>().state.emailErrorMessage;

      if (previousErrorMessage.haveContent()) {
        context.read<SignupBloc>().add(SignupEmailErrorEvent(errorMessage: ''));
      }

      context.read<SignupBloc>().add(SignupEmailChangeEvent(email: email));
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
          context.localization.email,
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 16),
        ClarityMask(
          child: TextField(
            controller: _emailController,
            style: AppTextStyles.p3Medium
                .copyWith(color: AppColors.textNeutralPrimary),
            decoration: InputDecoration(
              hintText: context.localization.email_hint,
              hintStyle: AppTextStyles.p3Medium
                  .copyWith(color: AppColors.textNeutralDisable),
              errorText:
                  emailErrorMessage.isNullOrEmpty() ? null : emailErrorMessage,
              errorStyle: AppTextStyles.p3Regular
                  .copyWith(color: AppColors.textErrorSecondary),
              border: buildOutlineInputBorder(),
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(hasFocus: true),
              errorBorder: buildOutlineInputBorder(isErrorBorder: true),
              focusedErrorBorder: buildOutlineInputBorder(
                hasFocus: true,
                isErrorBorder: true,
              ),
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
            ? AppColors.strokeErrorDefault
            : hasFocus ?? false
                ? AppColors.strokeBrandHover
                : AppColors.strokeNeutralLight200,
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _debouncer.cancel();
    super.dispose();
  }
}
