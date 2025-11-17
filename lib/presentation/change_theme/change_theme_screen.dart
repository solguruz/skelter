import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/change_theme/widgets/theme_list_options.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/utils/theme/bloc/theme_bloc.dart';
import 'package:skelter/utils/theme/bloc/theme_event.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

@RoutePage()
class ChangeThemeScreen extends StatefulWidget {
  const ChangeThemeScreen({super.key});

  @override
  State<ChangeThemeScreen> createState() => _ChangeThemeScreenState();
}

class _ChangeThemeScreenState extends State<ChangeThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: AppButton.icon(
          iconData: TablerIcons.arrow_left,
          iconOrTextColorOverride: context.currentTheme.iconNeutralDefault,
          size: AppButtonSize.extraLarge,
          onPressed: () => context.router.maybePop(),
        ),
        title: Text(
          context.localization.choose_app_theme,
          style: AppTextStyles.h6SemiBold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
      ),
      body: const _ChangeThemeScreenBody(),
    );
  }
}

class _ChangeThemeScreenBody extends StatelessWidget {
  const _ChangeThemeScreenBody();

  @override
  Widget build(BuildContext context) {
    final selectedThemeMode = context.select<ThemeBloc, ThemeMode?>(
      (bloc) => bloc.state.themeMode,
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: ThemeMode.values.map((themeMode) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ThemeListOptions(
                themeMode: themeMode.name.toLowerCase().capitalizeFirst,
                isSelected: selectedThemeMode == themeMode,
                onSelected: () => context
                    .read<ThemeBloc>()
                    .add(SetThemeModeEvent(mode: themeMode)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
