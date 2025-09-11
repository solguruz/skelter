import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/checkout/initial_checkout_screen.dart';
import 'package:skelter/presentation/home/bloc/home_bloc.dart';
import 'package:skelter/presentation/home/bloc/home_event.dart';
import 'package:skelter/presentation/home/widgets/bottom_nav_bar.dart';
import 'package:skelter/presentation/home/widgets/home_screen_body.dart';
import 'package:skelter/presentation/profile/profile_screen.dart';
import 'package:skelter/presentation/search/search_screen.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) =>
          HomeBloc(getProducts: sl())..add(const GetTopProductDataEvent()),
      child: const HomeScreenWrapper(),
    );
  }
}

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentIndex = context.select<HomeBloc, int>(
      (bloc) => bloc.state.currentBottomNavIndex,
    );
    return Scaffold(
      // To switch to GoogleNavBar, replace BottomNavBar with GoogleBottomNavBar
      // below.
      // bottomNavigationBar: const GoogleBottomNavBar(),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: const [
            HomeScreenBody(),
            SearchScreen(),
            InitialCheckoutScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
