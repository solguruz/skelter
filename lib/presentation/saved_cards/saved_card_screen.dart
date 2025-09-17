import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:skelter/presentation/saved_cards/widgets/empty_saved_card_view.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

@RoutePage()
class SavedCardScreen extends StatelessWidget {
  const SavedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.currentTheme.bgSurfaceBase,
      body: const EmptySavedCardView(),
    );
  }
}
