import 'package:material_ui/material_ui.dart';
import 'package:skelter/presentation/subscription_activated/widgets/navigate_to_home_screen_button.dart';
import 'package:skelter/presentation/subscription_activated/widgets/subscription_activated_message.dart';
import 'package:skelter/presentation/subscription_activated/widgets/subscription_activated_success_icon.dart';
import 'package:skelter/presentation/subscription_activated/widgets/subscription_activated_title.dart';

class SubscriptionActivatedScreen extends StatelessWidget {
  const SubscriptionActivatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  SubscriptionActivatedSuccessIcon(),
                  SizedBox(height: 24),
                  SubscriptionActivatedTitle(),
                  SizedBox(height: 12),
                  SubscriptionActivatedMessage(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: NavigateToHomeScreenButton(),
        ),
      ),
    );
  }
}
