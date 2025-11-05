import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/shipping_address/widgets/address_app_bar.dart';
import 'package:skelter/presentation/shipping_address/widgets/address_tile.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';

@RoutePage()
class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddressAppBar(isAddingAddress: false),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: AppButton(
            label: context.localization.save,
            size: AppButtonSize.large,
            onPressed: () {
              context.router.maybePop();
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    context.localization.deliver_to,
                    style: AppTextStyles.p2Bold.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                  ),
                  const Spacer(flex: 2),
                  Flexible(
                    child: AppButton(
                      style: AppButtonStyle.textOrIcon,
                      label: context.localization.add,
                      leftIcon: TablerIcons.plus,
                      isLeftIconAttachedToText: true,
                      foregroundColor: context.currentTheme.textBrandSecondary,
                      onPressed: () {
                        context.router.push(const AddAddressRoute());
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return AddressTile(
                      isSelected: index == 0,
                      isDefault: index == 0,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Padding(padding: EdgeInsets.all(8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
