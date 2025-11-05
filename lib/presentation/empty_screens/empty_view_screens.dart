import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';

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
                label: context.localization.wishlist,
                foregroundColor: context.currentTheme.textNeutralLight,
                onPressed: () {
                  context.pushRoute(const WishlistRoute());
                },
              ),
              const SizedBox(height: 16),
              AppButton(
                label: context.localization.server_error,
                foregroundColor: context.currentTheme.textNeutralLight,
                onPressed: () {
                  context.pushRoute(const ServerErrorRoute());
                },
              ),
              const SizedBox(height: 16),
              AppButton(
                label: context.localization.lost_connection,
                foregroundColor: context.currentTheme.textNeutralLight,
                onPressed: () {
                  context.pushRoute(const NoInternetRoute());
                },
              ),
              const SizedBox(height: 16),
              AppButton(
                label: context.localization.under_maintenance,
                foregroundColor: context.currentTheme.textNeutralLight,
                onPressed: () {
                  context.pushRoute(const UnderMaintenanceRoute());
                },
              ),
              const SizedBox(height: 16),
              AppButton(
                label: context.localization.empty_order_title,
                foregroundColor: context.currentTheme.textNeutralLight,
                onPressed: () {
                  context.pushRoute(const MyOrdersRoute());
                },
              ),
              const SizedBox(height: 16),
              AppButton(
                label: context.localization.empty_cards_list_title,
                foregroundColor: context.currentTheme.textNeutralLight,
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
