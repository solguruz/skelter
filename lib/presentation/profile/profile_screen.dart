import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter_skeleton/presentation/profile/bloc/profile_state.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/account_section.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/activity_section.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/profile_details.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/settings.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/sign_out.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/support_section.dart';
import 'package:flutter_skeleton/routes.gr.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: const ProfileScreenBody(),
      ),
    );
  }
}

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) async {
        if (state is SignOutState) {
          await context.router.replaceAll([const LoginWithPhoneNumberRoute()]);
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileDetails(),
              SizedBox(height: 40.0),
              AccountSection(),
              SizedBox(height: 24.0),
              ActivitySection(),
              SizedBox(height: 32.0),
              Settings(),
              SizedBox(height: 24.0),
              SupportSection(),
              SizedBox(height: 24.0),
              SignOut(),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
