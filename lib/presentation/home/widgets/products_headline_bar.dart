import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class ProductsHeadlineBar extends StatelessWidget {
  const ProductsHeadlineBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localization.top_products,
          style: AppTextStyles.p2SemiBold,
        ),
        AppButton(
          style: AppButtonStyle.textOrIcon,
          size: AppButtonSize.m,
          label: context.localization.see_all,
          onPressed: () => context.showSnackBar('See all products'),
        ),
      ],
    );
  }
}
