import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';
import 'package:flutter_skeleton/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/account_section.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/activity_section.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/profile_details.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/settings.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/sign_out.dart';
import 'package:flutter_skeleton/presentation/profile/widgets/support_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: const ProfilePageBody(),
      ),
    );
  }
}

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.L),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileDetails(),
            SizedBox(height: 40.0),
            AccountSection(),
            SizedBox(height: AppSize.XL),
            ActivitySection(),
            SizedBox(height: AppSize.XXL),
            Settings(),
            SizedBox(height: AppSize.XL),
            SupportSection(),
            SizedBox(height: AppSize.XL),
            SignOut(),
            SizedBox(height: AppSize.XXL),
          ],
        ),
      ),
    );
  }
}
