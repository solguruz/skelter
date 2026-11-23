import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class ContactUsSubmitButton extends StatelessWidget {
  const ContactUsSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16,
        bottom: 16 + context.bottomPadding,
      ),
      child: AppButton(
        label: context.localization.submit,
        foregroundColor: context.currentTheme.textNeutralLight,
        shouldSetFullWidth: true,
        size: AppButtonSize.extraLarge,
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          context.read<ContactUsBloc>().add(const SubmitFormEvent());
        },
      ),
    );
  }
}
