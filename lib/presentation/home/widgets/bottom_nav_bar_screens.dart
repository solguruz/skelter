import 'package:flutter/widgets.dart';
import 'package:skelter/presentation/checkout/initial_checkout_screen.dart';
import 'package:skelter/presentation/home/widgets/home_screen_body.dart';
import 'package:skelter/presentation/profile/profile_screen.dart';
import 'package:skelter/presentation/search/search_screen.dart';

const List<Widget> bottomNavBarScreens = [
  HomeScreenBody(),
  SearchScreen(),
  InitialCheckoutScreen(),
  ProfileScreen(),
];
