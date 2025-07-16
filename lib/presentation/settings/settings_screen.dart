import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/settings/widgets/delete_account.dart';
import 'package:flutter_skeleton/presentation/settings/widgets/settings.dart';
import 'package:flutter_skeleton/presentation/settings/widgets/settings_appbar.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingsAppbar(),
      body: SettingsScreenBody(),
    );
  }
}

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Settings(),
            SizedBox(height: 24.0),
            DeleteAccount(),
          ],
        ),
      ),
    );
  }
}
