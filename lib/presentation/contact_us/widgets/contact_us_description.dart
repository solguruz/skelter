import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class ContactUsDescription extends StatelessWidget {
  const ContactUsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localization.contact_us_message,
      style: AppTextStyles.p2Regular.copyWith(
        color: context.currentTheme.textNeutralPrimary,
      ),
    );
  }
}
