import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class SslFailedMessage extends StatelessWidget {
  const SslFailedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.76,
      ),
      child: Text(
        context.localization.secure_connection_failed_message,
        textAlign: TextAlign.center,
        style: AppTextStyles.p3Regular
            .copyWith(color: context.currentTheme.textNeutralSecondary),
      ),
    );
  }
}
