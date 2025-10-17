import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart';
import 'package:skelter/presentation/signup/screens/phone_num_verified_page/widgets/next_button.dart';

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
          left: LoginWithPhoneNumberScreen.kHorizontalPadding,
          right: LoginWithPhoneNumberScreen.kHorizontalPadding,
          bottom: max(20, MediaQuery.of(context).padding.bottom),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 1.4,
              child: Lottie.asset(
                Assets.animations.successCheckmarkBlueBg,
                width: 80,
                height: 80,
                repeat: false,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              context.localization.phone_no_verified,
              style: AppTextStyles.h2Bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                context.localization.phone_no_verified_info,
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
