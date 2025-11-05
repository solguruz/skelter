import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

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
        color: isSelected
            ? context.currentTheme.bgBrandLight50
            : context.currentTheme.bgShadesWhite,
        border: Border.all(
          color: isDefault
              ? context.currentTheme.iconBrandHover
              : context.currentTheme.strokeNeutralLight200,
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
                        style: AppTextStyles.p2Medium.copyWith(
                          color: context.currentTheme.textNeutralPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: isDefault ? 8 : 0),
                    if (isDefault)
                      AppButton(
                        label: 'Default',
                        backgroundColor: context.currentTheme.bgBrandDefault,
                        size: AppButtonSize.extraSmall,
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '2118 Thornridge Cir. Syracuse, Connecticut 35624 2118',
                  style: AppTextStyles.p3Regular.copyWith(
                    color: context.currentTheme.textNeutralSecondary,
                  ),
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
              color: context.currentTheme.bgShadesWhite,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor2.withAlpha(15),
                  spreadRadius: 1,
                  blurRadius: 6,
                ),
              ],
              border: Border.all(
                color: context.currentTheme.strokeNeutralLight200,
              ),
            ),
            child: AppButton.icon(
              iconData: TablerIcons.trash,
              iconOrTextColorOverride: context.currentTheme.iconNeutralHover,
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
