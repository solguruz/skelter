import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/home/bloc/home_bloc.dart';
import 'package:skelter/presentation/home/bloc/home_event.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentIndex = context.select<HomeBloc, int>(
      (bloc) => bloc.state.currentBottomNavIndex,
    );
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => context.read<HomeBloc>().add(
            BottomNavBarIndexChangedEvent(index: value),
          ),
      selectedItemColor: context.currentTheme.iconBrandHover,
      unselectedItemColor: context.currentTheme.strokeNeutralDefault,
      showUnselectedLabels: true,
      selectedLabelStyle: AppTextStyles.p4Medium,
      unselectedLabelStyle: AppTextStyles.p4Medium,
      type: BottomNavigationBarType.fixed,
      backgroundColor: context.currentTheme.bgSurfaceBase2,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(TablerIcons.home),
          label: context.localization.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(TablerIcons.search),
          label: context.localization.search,
        ),
        BottomNavigationBarItem(
          icon: const Icon(TablerIcons.shopping_cart),
          label: context.localization.cart,
        ),
        BottomNavigationBarItem(
          icon: const Icon(TablerIcons.user),
          label: context.localization.profile,
        ),
      ],
    );
  }
}
