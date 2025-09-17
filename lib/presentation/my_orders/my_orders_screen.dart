import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skelter/presentation/my_orders/widgets/empty_orders_view.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

@RoutePage()
class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.currentTheme.bgSurfaceBase,
      body: const SafeArea(child: EmptyOrdersView()),
    );
  }
}
