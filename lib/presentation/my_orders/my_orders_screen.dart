import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skelter/presentation/my_orders/widgets/empty_orders_view.dart';

@RoutePage()
class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: EmptyOrdersView()),
    );
  }
}
