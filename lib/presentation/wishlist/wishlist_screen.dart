import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/wishlist/widgets/empty_wishlist_view.dart';
import 'package:flutter_skeleton/presentation/wishlist/widgets/wishlist_app_bar.dart';

@RoutePage()
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WishlistAppBar(),
      body: EmptyWishlistView(),
    );
  }
}
