import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class ContactUsMessageSection extends StatefulWidget {
  const ContactUsMessageSection({super.key});

  @override
  State<ContactUsMessageSection> createState() =>
      _ContactUsMessageSectionState();
}

class _ContactUsMessageSectionState extends State<ContactUsMessageSection> {
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messageController.text = context.contactUsBloc.state.description;
    _messageController.addListener(() {
      nameControllerListener();
    });
  }

  void nameControllerListener() {
    final String? previousError = context.contactUsBloc.state.descriptionError;
    if (previousError != null && previousError.isNotEmpty) {
      context.contactUsBloc.add(const DescriptionErrorEvent(error: ''));
    }
    context.contactUsBloc
        .add(DescriptionChangedEvent(message: _messageController.text));
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final message = context.select<ContactUsBloc, int>(
      (bloc) => bloc.state.description.length,
    );
    final errorMessage = context.select<ContactUsBloc, String?>(
      (bloc) => bloc.state.descriptionError,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.message,
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _messageController,
          maxLength: 250,
          decoration: InputDecoration(
            hintText: context.l10n.message_description,
            hintStyle:
                AppTextStyles.p3Regular.withColor(AppColors.textNeutralDisable),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            counterText: '',
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 12, top: 70),
              child: Text(
                '$message/250',
                style: AppTextStyles.p4Regular
                    .withColor(AppColors.textNeutralDisable),
              ),
            ),
            suffixIconConstraints: const BoxConstraints(),
            errorText: errorMessage.isNullOrEmpty() ? null : errorMessage,
          ),
          maxLines: 4,
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }
}
