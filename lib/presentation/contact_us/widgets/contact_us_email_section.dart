import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

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
    _emailController.text = context.contactUsBloc.state.email;
    _emailController.addListener(() {
      _emailControllerListener();
    });
  }

  void _emailControllerListener() {
    final String? previousError = context.contactUsBloc.state.emailError;
    if (previousError != null && previousError.isNotEmpty) {
      context.contactUsBloc.add(const EmailErrorEvent(error: ''));
    }
    context.contactUsBloc.add(EmailChangedEvent(email: _emailController.text));
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
          context.l10n.email_id,
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: context.l10n.enter_your_email_id,
            hintStyle:
                AppTextStyles.p2Medium.withColor(AppColors.textNeutralDisable),
            errorText: emailError.isNullOrEmpty() ? null : emailError,
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
