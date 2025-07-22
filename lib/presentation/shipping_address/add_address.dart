import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/shipping_address/widgets/address_app_bar.dart';
import 'package:flutter_skeleton/presentation/shipping_address/widgets/address_text_field.dart';
import 'package:flutter_skeleton/presentation/shipping_address/widgets/city_dropdown.dart';
import 'package:flutter_skeleton/presentation/shipping_address/widgets/country_dropdown.dart';
import 'package:flutter_skeleton/presentation/shipping_address/widgets/name_text_field.dart';
import 'package:flutter_skeleton/presentation/shipping_address/widgets/save_button.dart';
import 'package:flutter_skeleton/presentation/shipping_address/widgets/set_default_address.dart';
import 'package:flutter_skeleton/presentation/shipping_address/widgets/state_dropdown.dart';
import 'package:flutter_skeleton/presentation/shipping_address/widgets/zip_code_text_field.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

@RoutePage()
class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddressAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButton(
                  style: AppButtonStyle.outline,
                  size: AppButtonSize.extraLarge,
                  label: context.localization.use_current_location,
                  leftIcon: TablerIcons.map_pin,
                  isLeftIconAttachedToText: true,
                  shouldSetFullWidth: true,
                ),
                const SizedBox(height: 16),
                const NameTextField(),
                const SizedBox(height: 16),
                const CountryDropdown(),
                const SizedBox(height: 16),
                const StateDropdown(),
                const SizedBox(height: 16),
                const CityDropdown(),
                const SizedBox(height: 16),
                const ZipCodeTextField(),
                const SizedBox(height: 16),
                const AddressTextField(),
                const SizedBox(height: 16),
                const SetDefaultAddress(),
                const SizedBox(height: 26),
                const SaveAddressButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
