import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:skelter/presentation/contact_us/constant/contact_us_constants.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/validators/validators.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

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
    _messageController.text = context.read<ContactUsBloc>().state.description;
    _messageController.addListener(() {
      nameControllerListener();
    });
  }

  void nameControllerListener() {
    final String? previousError =
        context.read<ContactUsBloc>().state.descriptionError;
    if (previousError != null && previousError.isNotEmpty) {
      context.read<ContactUsBloc>().add(const DescriptionErrorEvent(error: ''));
    }
    context
        .read<ContactUsBloc>()
        .add(DescriptionChangedEvent(message: _messageController.text));
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select<ContactUsBloc, String?>(
      (bloc) => bloc.state.descriptionError,
    );

    final description = context.select<ContactUsBloc, String>(
      (bloc) => bloc.state.description,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.message,
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 6),
        ClarityMask(
          child: TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: context.localization.message_description,
              hintStyle: AppTextStyles.p3Regular
                  .copyWith(color: AppColors.textNeutralDisable),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              errorText: errorMessage.isNullOrEmpty() ? null : errorMessage,
              counterText:
                  '${description.length}/$kMessageMaxLength',
              counterStyle: AppTextStyles.p4Regular
                  .copyWith(color: AppColors.textNeutralDisable),
            ),
            maxLines: 4,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => maxLengthValidator(
              value,
              kMessageMaxLength,
              context,
            ),
            keyboardType: TextInputType.multiline,
          ),
        ),
      ],
    );
  }
}
