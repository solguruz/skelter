import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({super.key});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  final TextEditingController _fullNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final List<String> _countries = ['India', 'USA', 'UK'];
  String? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.country,
          style: AppTextStyles.p3Medium.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: context.currentTheme.bgSurfaceBase2,
            hintText: context.localization.select_country,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: buildOutlineInputBorder(hasFocus: false),
            enabledBorder: buildOutlineInputBorder(hasFocus: false),
            focusedBorder: buildOutlineInputBorder(hasFocus: true),
            errorBorder: buildOutlineInputBorder(isErrorBorder: true),
          ),
          value: _selectedCountry,
          icon: const Icon(TablerIcons.chevron_down),
          hint: Text(
            context.localization.select_country,
            style: AppTextStyles.p2Medium
                .copyWith(color: context.currentTheme.textNeutralDisable),
          ),
          dropdownColor: context.currentTheme.bgSurfaceBase2,
          items: _countries.map((String country) {
            return DropdownMenuItem<String>(
              value: country,
              child: Text(
                country,
                style: AppTextStyles.p2Regular.copyWith(
                  color: context.currentTheme.textNeutralPrimary,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCountry = newValue;
              debugPrint('Selected country: $_selectedCountry');
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a country';
            }
            return null;
          },
          isExpanded: true,
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder({
    bool? hasFocus,
    bool? isErrorBorder,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isErrorBorder ?? false
            ? context.currentTheme.strokeErrorDefault
            : hasFocus ?? false
                ? context.currentTheme.strokeBrandHover
                : context.currentTheme.strokeNeutralLight200,
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }
}
