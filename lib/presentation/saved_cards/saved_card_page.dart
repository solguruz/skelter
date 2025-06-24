import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/saved_cards/widgets/empty_saved_card_view.dart';

@RoutePage()
class SavedCardPage extends StatelessWidget {
  const SavedCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: EmptySavedCardView());
  }
}
