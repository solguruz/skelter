import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/home/bloc/home_bloc.dart';
import 'package:skelter/presentation/home/bloc/home_event.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class GoogleBottomNavBar extends StatelessWidget {
  const GoogleBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentIndex = context.select<HomeBloc, int>(
      (bloc) => bloc.state.currentBottomNavIndex,
    );

    return GNav(
      onTabChange: (index) {
        context
            .read<HomeBloc>()
            .add(BottomNavBarIndexChangedEvent(index: index));
      },
      tabMargin:
          const EdgeInsets.only(bottom: 26, top: 21, left: 22, right: 22),
      selectedIndex: currentIndex,
      textStyle: AppTextStyles.p4Medium
          .copyWith(color: context.currentTheme.textBrandSecondary),
      tabBorderRadius: 20,
      curve: Curves.easeOutExpo,
      duration: const Duration(milliseconds: 300),
      gap: 4,
      color: context.currentTheme.strokeNeutralDefault,
      activeColor: context.currentTheme.bgBrandHover,
      iconSize: 24,
      tabBackgroundColor: context.currentTheme.bgBrandLight50,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      tabs: [
        GButton(
          icon: TablerIcons.smart_home,
          text: context.localization.home,
        ),
        GButton(
          icon: TablerIcons.search,
          text: context.localization.search,
        ),
        GButton(
          icon: TablerIcons.shopping_cart,
          text: context.localization.cart,
        ),
        GButton(
          icon: TablerIcons.user,
          text: context.localization.profile,
        ),
      ],
    );
  }
}
