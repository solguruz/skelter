import 'package:auto_route/auto_route.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_skeleton/presentation/home/widgets/bottom_nav_bar.dart';
import 'package:flutter_skeleton/presentation/home/widgets/home_page_body.dart';
import 'package:flutter_skeleton/presentation/map/map_page.dart';
import 'package:flutter_skeleton/presentation/notifications/notifications_page.dart';
import 'package:flutter_skeleton/presentation/profile/profile_page.dart';
import 'package:flutter_skeleton/presentation/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: const HomePageWrapper(),
    );
  }
}

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

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
            HomePageBody(),
            SearchPage(),
            MapPage(),
            NotificationsPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
