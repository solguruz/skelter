import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/core/services/injection_container.dart';
import 'package:flutter_skeleton/presentation/checkout/initial_checkout_screen.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_event.dart';
import 'package:flutter_skeleton/presentation/home/widgets/bottom_nav_bar.dart';
import 'package:flutter_skeleton/presentation/home/widgets/home_screen_body.dart';
import 'package:flutter_skeleton/presentation/profile/profile_screen.dart';
import 'package:flutter_skeleton/presentation/search/search_screen.dart';

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
