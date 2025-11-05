import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class SslFailedTitle extends StatelessWidget {
  const SslFailedTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Text(
        context.localization.secure_connection_failed_title,
        textAlign: TextAlign.center,
        style: AppTextStyles.h4SemiBold
            .copyWith(color: context.currentTheme.textNeutralPrimary),
      ),
    );
  }
}
