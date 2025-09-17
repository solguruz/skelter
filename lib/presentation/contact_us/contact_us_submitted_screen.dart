import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skelter/presentation/contact_us/widgets/back_to_home_button.dart';
import 'package:skelter/presentation/contact_us/widgets/submission_success_icon.dart';
import 'package:skelter/presentation/contact_us/widgets/submission_success_message.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

@RoutePage()
class ContactUsSubmittedScreen extends StatelessWidget {
  const ContactUsSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.router.replaceAll([const HomeRoute()]);
      },
      child: Scaffold(
        backgroundColor: AppColors.currentTheme.bgSurfaceBase,
        body: const ContactUsSubmittedBody(),
      ),
    );
  }
}

class ContactUsSubmittedBody extends StatelessWidget {
  const ContactUsSubmittedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Column(
          children: [
            Spacer(),
            SubmissionSuccessIcon(),
            SizedBox(height: 24.0),
            SubmissionSuccessMessage(),
            Spacer(),
            BackToHomeButton(),
            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
