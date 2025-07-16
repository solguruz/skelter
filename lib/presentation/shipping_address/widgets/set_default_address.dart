import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

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
          side: const BorderSide(
            color: AppColors.strokeNeutralLight200,
            width: 2,
          ),
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: AppColors.bgBrandDefault,
        ),
        const SizedBox(width: 8),
        Text(
          context.localization.set_as_default_address,
          style: AppTextStyles.p2Medium,
        ),
      ],
    );
  }
}
