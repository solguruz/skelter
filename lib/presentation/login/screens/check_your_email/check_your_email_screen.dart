import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/screens/check_your_email/widgets/continue_login_button.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart';

@RoutePage()
class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<LoginBloc>.value(
        value: loginBloc,
        child: const CheckYourEmailScreenBody(),
      ),
    );
  }
}

class CheckYourEmailScreenBody extends StatelessWidget {
  const CheckYourEmailScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String email = context.select<LoginBloc, String>(
      (bloc) => bloc.state.emailPasswordLoginState?.email ?? '',
    );
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          context.read<LoginBloc>().add(ResetEmailStateEvent());
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: LoginWithPhoneNumberScreen.kHorizontalPadding,
            right: LoginWithPhoneNumberScreen.kHorizontalPadding,
            bottom: max(20, MediaQuery.of(context).padding.bottom),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.icons.emailNotification),
              const SizedBox(height: 18),
              Text(
                context.localization.check_your_email,
                style: AppTextStyles.h2Bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              Text(
                context.localization.link_send_info(email),
                style: AppTextStyles.p2Medium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              const ContinueLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
