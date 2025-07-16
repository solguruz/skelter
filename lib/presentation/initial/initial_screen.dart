import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/models/login_details.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/shared_pref/pref_keys.dart';
import 'package:flutter_skeleton/shared_pref/prefs.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';

@RoutePage()
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Future<void> _checkAuthStatus(BuildContext context) async {
    final userDetailsJson = await Prefs.getString(PrefKeys.kUserDetails);
    final userDetails = LoginDetails.fromJson(
      json.decode(userDetailsJson ?? '{}'),
    );

    if ((userDetails.uid ?? '').haveContent()) {
      await context.router.replace(const HomeRoute());
    } else {
      await context.router.replace(const LoginWithPhoneNumberRoute());
    }
  }

  @override
  void initState() {
    super.initState();
    _checkAuthStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox.shrink(),
    );
  }
}
