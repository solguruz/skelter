import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

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
      decoration: InputDecoration(
        hintText: context.localization.search,
        hintStyle: AppTextStyles.p3Medium.withColor(
          AppColors.textNeutralDisable,
        ),
        prefixIcon: const Icon(
          TablerIcons.search,
          color: AppColors.strokeNeutralDisabled,
        ),
        suffixIcon: const Icon(
          TablerIcons.microphone,
          color: AppColors.strokeNeutralDisabled,
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
