import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_event.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentIndex = context.select<HomeBloc, int>(
      (bloc) => bloc.state.currentBottomNavIndex,
    );
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => context.homeBloc.add(
        BottomNavBarIndexChangedEvent(index: value),
      ),
      selectedItemColor: AppColors.iconBrandHover,
      unselectedItemColor: AppColors.strokeNeutralDefault,
      showUnselectedLabels: true,
      selectedLabelStyle: AppTextStyles.p4Medium,
      unselectedLabelStyle: AppTextStyles.p4Medium,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(TablerIcons.home),
          label: context.l10n.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(TablerIcons.search),
          label: context.l10n.search,
        ),
        BottomNavigationBarItem(
          icon: const Icon(TablerIcons.map_pin),
          label: context.l10n.map,
        ),
        BottomNavigationBarItem(
          icon: const Icon(TablerIcons.bell),
          label: context.l10n.notifications,
        ),
        BottomNavigationBarItem(
          icon: const Icon(TablerIcons.user),
          label: context.l10n.profile,
        ),
      ],
    );
  }
}
