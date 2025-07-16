import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/back_to_home_button.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/submission_success_icon.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/submission_success_message.dart';
import 'package:flutter_skeleton/routes.gr.dart';

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
      child: const Scaffold(
        body: ContactUsSubmittedBody(),
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
