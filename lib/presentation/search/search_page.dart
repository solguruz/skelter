import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.l10n.search),
    );
  }
}
