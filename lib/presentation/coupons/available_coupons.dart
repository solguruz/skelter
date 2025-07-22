import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/coupons/widgets/available_coupons_app_bar.dart';
import 'package:flutter_skeleton/presentation/coupons/widgets/coupon_item.dart';

@RoutePage()
class AvailableCouponsScreen extends StatelessWidget {
  const AvailableCouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplyCouponsAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const CouponItem();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
          ),
        ),
      ),
    );
  }
}
