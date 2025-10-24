import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ReviewsButton extends StatelessWidget {
  const ReviewsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.62,
      child: AppButton(
        label: context.localization.view_product_review,
        backgroundColor: AppColors.bgBrandDefault,
        size: AppButtonSize.extraLarge,
        leftIcon: TablerIcons.star,
        isLeftIconAttachedToText: true,
        paddingOverride: EdgeInsets.zero,
        onPressed: () {
          context.showSnackBar('View product reviews');
        },
      ),
    );
  }
}
