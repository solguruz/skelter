import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class ContactUsSubmitCTA extends StatelessWidget {
  const ContactUsSubmitCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.L,
        vertical: AppSize.XL,
      ),
      child: AppButton(
        label: context.l10n.submit,
        fillWidth: true,
        size: AppButtonSize.xl,
        onPressed: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          context.contactUsBloc.add(const SubmitFormEvent());
        },
      ),
    );
  }
}
