import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class ContactUsNameSection extends StatefulWidget {
  const ContactUsNameSection({super.key});

  @override
  State<ContactUsNameSection> createState() => _ContactUsNameSectionState();
}

class _ContactUsNameSectionState extends State<ContactUsNameSection> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = context.read<ContactUsBloc>().state.name;
    _nameController.addListener(() {
      nameControllerListener();
    });
  }

  void nameControllerListener() {
    final String? previousError = context.read<ContactUsBloc>().state.nameError;
    if (previousError != null && previousError.isNotEmpty) {
      context.read<ContactUsBloc>().add(const NameErrorEvent(error: ''));
    }
    context
        .read<ContactUsBloc>()
        .add(NameChangedEvent(name: _nameController.text));
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? nameError = context.select<ContactUsBloc, String?>(
      (bloc) => bloc.state.nameError,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.name,
          style: AppTextStyles.p3Medium,
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            hintText: context.localization.enter_your_name,
            hintStyle:
                AppTextStyles.p2Medium.withColor(AppColors.textNeutralDisable),
            errorText: nameError.isNullOrEmpty() ? null : nameError,
          ),
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
