import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class SetDefaultAddress extends StatelessWidget {
  const SetDefaultAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          onChanged: (value) {},
          value: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: BorderSide(
            color: context.currentTheme.strokeNeutralLight200,
            width: 2,
          ),
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: context.currentTheme.bgBrandDefault,
        ),
        const SizedBox(width: 8),
        Text(
          context.localization.set_as_default_address,
          style: AppTextStyles.p2Medium.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
      ],
    );
  }
}
