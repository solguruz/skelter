import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:skelter/presentation/saved_cards/widgets/empty_saved_card_view.dart';
import 'package:skelter/presentation/theme/extention/theme_extension.dart';

@RoutePage()
class SavedCardScreen extends StatelessWidget {
  const SavedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.currentTheme.bgSurfaceBase,
      body: const EmptySavedCardView(),
    );
  }
}
