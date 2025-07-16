import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

@RoutePage()
class EmptyViewsScreen extends StatelessWidget {
  const EmptyViewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              AppButton(
                label: context.l10n.wishlist,
                onPressed: () {
                  context.pushRoute(const WishlistRoute());
                },
              ),
              const SizedBox(height: 16),
              AppButton(
                label: context.l10n.server_error,
                onPressed: () {
                  context.pushRoute(const ServerErrorRoute());
                },
              ),
              const SizedBox(height: 16),
              AppButton(
                label: context.l10n.lost_connection,
                onPressed: () {
                  context.pushRoute(const NoInternetRoute());
                },
              ),
              const SizedBox(height: 16),
              AppButton(
                label: context.l10n.under_maintenance,
                onPressed: () {
                  context.pushRoute(const UnderMaintenanceRoute());
                },
              ),
              const SizedBox(height: 16),
              AppButton(
                label: context.l10n.empty_order_title,
                onPressed: () {
                  context.pushRoute(const MyOrdersRoute());
                },
              ),
              const SizedBox(height: 16),
              AppButton(
                label: context.l10n.empty_cards_list_title,
                onPressed: () {
                  context.pushRoute(const SavedCardRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
