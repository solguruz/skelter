import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
    super.key,
    this.isSelected = false,
    this.isDefault = false,
  });

  final bool isSelected;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.bgBrandLight50 : AppColors.white,
        border: Border.all(
          color: isDefault
              ? AppColors.iconBrandHover
              : AppColors.strokeNeutralLight200,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Roz Cooper',
                        style: AppTextStyles.p2Medium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: isDefault ? 8 : 0),
                    if (isDefault)
                      const AppButton(
                        label: 'Default',
                        backgroundColor: AppColors.bgBrandDefault,
                        size: AppButtonSize.extraSmall,
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '2118 Thornridge Cir. Syracuse, Connecticut 35624 2118',
                  style: AppTextStyles.p3Regular,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
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
              iconData: TablerIcons.trash,
              onPressed: () {
                context.showSnackBar('Delete Address');
              },
            ),
          ),
        ],
      ),
    );
  }
}
