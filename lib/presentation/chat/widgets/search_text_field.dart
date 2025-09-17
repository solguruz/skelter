import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _searchTextController = TextEditingController();
  final debouncer =
      Debouncer<String>(const Duration(milliseconds: 500), initialValue: '');

  @override
  void initState() {
    super.initState();
    _searchTextController.text = '';
    _searchTextController.addListener(() {
      debouncer.value = _searchTextController.text;
    });
    debouncer.values.listen((search) => debugPrint('Search: $search'));
  }

  @override
  void dispose() {
    debouncer.cancel();
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchTextController,
      style: AppTextStyles.p3Medium
          .copyWith(color: AppColors.currentTheme.textNeutralPrimary),
      decoration: InputDecoration(
        hintText: context.localization.search,
        hintStyle: AppTextStyles.p3Medium.copyWith(
          color: AppColors.currentTheme.textNeutralDisable,
        ),
        filled: true,
        fillColor: AppColors.currentTheme.bgSurfaceBase2,
        prefixIcon: Icon(
          TablerIcons.search,
          color: AppColors.currentTheme.strokeNeutralDisabled,
        ),
        suffixIcon: Icon(
          TablerIcons.microphone,
          color: AppColors.currentTheme.strokeNeutralDisabled,
        ),
        border: buildOutlineInputBorder(hasFocus: false),
        enabledBorder: buildOutlineInputBorder(hasFocus: false),
        focusedBorder: buildOutlineInputBorder(hasFocus: true),
        errorBorder: buildOutlineInputBorder(isErrorBorder: true),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
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
            ? AppColors.currentTheme.strokeErrorDefault
            : hasFocus ?? false
                ? AppColors.currentTheme.strokeBrandHover
                : AppColors.currentTheme.strokeNeutralLight200,
      ),
    );
  }
}
