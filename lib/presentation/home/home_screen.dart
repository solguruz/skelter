import 'package:auto_route/auto_route.dart';
import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/ai_chat/widgets/ai_chat_fab.dart';
import 'package:skelter/presentation/checkout/initial_checkout_screen.dart';
import 'package:skelter/presentation/home/bloc/home_bloc.dart';
import 'package:skelter/presentation/home/bloc/home_event.dart';
import 'package:skelter/presentation/home/widgets/bottom_nav_bar.dart';
import 'package:skelter/presentation/home/widgets/home_screen_body.dart';
import 'package:skelter/presentation/my_orders/my_orders_screen.dart';
import 'package:skelter/presentation/profile/profile_screen.dart';
import 'package:skelter/services/in_app_review_service.dart';
import 'package:skelter/utils/app_environment.dart';

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

class HomeScreenWrapper extends StatefulWidget {
  const HomeScreenWrapper({super.key});

  @override
  State<HomeScreenWrapper> createState() => HomeScreenWrapperState();
}

class HomeScreenWrapperState extends State<HomeScreenWrapper> {
  final GlobalKey bottomNavKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (AppEnvironment.isTestEnvironment) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sl<InAppReviewService>().requestReviewIfEligible();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreenBody(bottomNavKey: bottomNavKey),
      const MyOrdersScreen(),
      const InitialCheckoutScreen(),
      const ProfileScreen(),
    ];

    final int currentIndex = context.select<HomeBloc, int>(
      (bloc) => bloc.state.currentBottomNavIndex,
    );
    final String screenName = pages[currentIndex].runtimeType.toString();
    Clarity.setCurrentScreenName(screenName);

    return PopScope(
      canPop: currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && currentIndex != 0) {
          context.read<HomeBloc>().add(
            const BottomNavBarIndexChangedEvent(index: 0),
          );
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(key: bottomNavKey),
        floatingActionButton: const AiChatFab(),
        body: SafeArea(
          child: IndexedStack(index: currentIndex, children: pages),
        ),
      ),
    );
  }
}
