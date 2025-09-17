import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:skelter/utils/extensions/string.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ContactUsEmailSection extends StatefulWidget {
  const ContactUsEmailSection({super.key});

  @override
  State<ContactUsEmailSection> createState() => _ContactUsEmailSectionState();
}

class _ContactUsEmailSectionState extends State<ContactUsEmailSection> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = context.read<ContactUsBloc>().state.email;
    _emailController.addListener(() {
      _emailControllerListener();
    });
  }

  void _emailControllerListener() {
    final String? previousError =
        context.read<ContactUsBloc>().state.emailError;
    if (previousError != null && previousError.isNotEmpty) {
      context.read<ContactUsBloc>().add(const EmailErrorEvent(error: ''));
    }
    context
        .read<ContactUsBloc>()
        .add(EmailChangedEvent(email: _emailController.text));
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? emailError = context.select<ContactUsBloc, String?>(
      (bloc) => bloc.state.emailError,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.email_id,
          style: AppTextStyles.p3Medium.copyWith(
            color: AppColors.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _emailController,
          style: AppTextStyles.p3Medium.copyWith(
            color: AppColors.currentTheme.textNeutralPrimary,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.currentTheme.bgSurfaceBase2,
            hintText: context.localization.enter_your_email_id,
            hintStyle: AppTextStyles.p2Medium
                .copyWith(color: AppColors.currentTheme.textNeutralDisable),
            errorText: emailError.isNullOrEmpty() ? null : emailError,
            border: buildOutlineInputBorder(hasFocus: false),
            enabledBorder: buildOutlineInputBorder(hasFocus: false),
            focusedBorder: buildOutlineInputBorder(hasFocus: true),
            errorBorder: buildOutlineInputBorder(isErrorBorder: true),
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
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
            ? AppColors.currentTheme.strokeErrorDefault
            : hasFocus ?? false
                ? AppColors.currentTheme.strokeBrandHover
                : AppColors.currentTheme.strokeNeutralLight200,
      ),
    );
  }
}
