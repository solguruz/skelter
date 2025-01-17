import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(context.l10n.profile),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
