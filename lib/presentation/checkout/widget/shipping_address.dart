import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Roz Cooper',
                  style: AppTextStyles.p2Medium,
                ),
                const SizedBox(height: 8),
                Text(
                  '2118 Thornridge Cir. Syracuse, Connecticut 35624',
                  style: AppTextStyles.p3Regular,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor2.withAlpha(15),
                  spreadRadius: 1,
                  blurRadius: 6,
                ),
              ],
            ),
            child: AppButton.icon(
              iconData: TablerIcons.pencil,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
