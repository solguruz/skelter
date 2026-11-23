import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class BiometricAuthDescription extends StatelessWidget {
  const BiometricAuthDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localization.biometric_auth_description,
      style: AppTextStyles.p2Regular.copyWith(
        color: context.currentTheme.textNeutralPrimary,
      ),
    );
  }
}
