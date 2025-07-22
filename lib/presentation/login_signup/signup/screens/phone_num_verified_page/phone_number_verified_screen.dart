import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_screen.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/phone_num_verified_page/widgets/next_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class PhoneNumberVerifiedScreen extends StatelessWidget {
  const PhoneNumberVerifiedScreen({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>.value(
        value: loginBloc,
        child: const PhoneNumberVerifiedScreenBody(),
      ),
    );
  }
}

class PhoneNumberVerifiedScreenBody extends StatelessWidget {
  const PhoneNumberVerifiedScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: LoginScreen.kHorizontalPadding,
          right: LoginScreen.kHorizontalPadding,
          bottom: max(20, MediaQuery.of(context).padding.bottom),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.icons.tick),
            const SizedBox(height: 18),
            Text(
              context.localization.login_signup_Phone_no_verified,
              style: AppTextStyles.h2Bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                context.localization.login_signup_Phone_no_verified_info,
                style: AppTextStyles.p2Medium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
            const NextButton(),
          ],
        ),
      ),
    );
  }
}
