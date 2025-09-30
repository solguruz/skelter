import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skelter/presentation/theme/extention/theme_extension.dart';
import 'package:skelter/presentation/wishlist/widgets/empty_wishlist_view.dart';
import 'package:skelter/presentation/wishlist/widgets/wishlist_app_bar.dart';

@RoutePage()
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.currentTheme.bgSurfaceBase,
      appBar: const WishlistAppBar(),
      body: const EmptyWishlistView(),
    );
  }
}
