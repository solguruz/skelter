import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppButton(
        label: context.localization.add_to_cart,
        size: AppButtonSize.extraLarge,
        backgroundColor: AppColors.bgWarningDefault,
        leftIcon: TablerIcons.shopping_cart_plus,
        isLeftIconAttachedToText: true,
        paddingOverride: EdgeInsets.zero,
        onPressed: () {
          context.showSnackBar('Item added to cart');
        },
      ),
    );
  }
}
