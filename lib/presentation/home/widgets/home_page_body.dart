import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(TablerIcons.arrow_autofit_content),
        title: Text(context.l10n.home),
      ),
      body: Center(
        child: Text(context.l10n.home),
      ),
    );
  }
}
