import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_screen.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_app_bar.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/profile_picture/widgets/add_skip_picture_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/profile_picture/widgets/done_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/profile_picture/widgets/edit_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/profile_picture/widgets/selected_profile_picture.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/profile_picture/widgets/user_placeholder.dart';

@RoutePage()
class AddProfilePictureScreen extends StatelessWidget {
  const AddProfilePictureScreen({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      body: SafeArea(
        child: BlocProvider<LoginBloc>.value(
          value: loginBloc,
          child: const AddProfilePictureScreenBody(),
        ),
      ),
    );
  }
}

class AddProfilePictureScreenBody extends StatelessWidget {
  const AddProfilePictureScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final File? profilePicture = context.select<LoginBloc, File?>(
      (bloc) => bloc.state.signupState?.selectedProfilePicture,
    );

    final bool isDoneEditing = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.signupState?.isDoneProfilePicEditing ?? false,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LoginScreen.kHorizontalPadding,
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              context.localization.login_signup_add_profile_picture,
              style: AppTextStyles.h2Bold,
            ),
          ),
          const SizedBox(height: 40),
          if (profilePicture != null)
            Column(
              children: [
                const SelectedProfilePicture(),
                const SizedBox(height: 10),
                if (isDoneEditing) const EditButton(),
              ],
            )
          else
            const UserPlaceholder(),
          const Spacer(),
          if (isDoneEditing)
            const DoneButton()
          else
            const AddSkipPictureButton(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
