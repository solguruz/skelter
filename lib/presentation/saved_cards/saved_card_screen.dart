import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/saved_cards/widgets/empty_saved_card_view.dart';

@RoutePage()
class SavedCardScreen extends StatelessWidget {
  const SavedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: EmptySavedCardView());
  }
}
