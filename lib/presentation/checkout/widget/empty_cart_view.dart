import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.icons.emptyCart,
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 24),
          Text(
            context.localization.your_cart_is_empty,
            style: AppTextStyles.p1SemiBold,
          ),
          const SizedBox(height: 8),
          Text(
            context.localization.empty_cart_message,
            style: AppTextStyles.p3Regular,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          AppButton(
            label: context.localization.explore_products,
            onPressed: () {},
            size: AppButtonSize.extraLarge,
          ),
        ],
      ),
    );
  }
}
