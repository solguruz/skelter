import 'package:flutter/material.dart';
import 'package:skelter/i18n/localization.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.localization.map),
    );
  }
}
