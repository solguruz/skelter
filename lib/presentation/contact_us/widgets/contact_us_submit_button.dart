import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';

class ContactUsSubmitButton extends StatelessWidget {
  const ContactUsSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      child: AppButton(
        label: context.localization.submit,
        shouldSetFullWidth: true,
        size: AppButtonSize.extraLarge,
        onPressed: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          context.read<ContactUsBloc>().add(const SubmitFormEvent());
        },
      ),
    );
  }
}
