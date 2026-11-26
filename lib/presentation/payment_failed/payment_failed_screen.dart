import 'package:material_ui/material_ui.dart';
import 'package:skelter/presentation/payment_failed/widgets/navigate_to_home_screen_button.dart';
import 'package:skelter/presentation/payment_failed/widgets/payment_failed_icon.dart';
import 'package:skelter/presentation/payment_failed/widgets/payment_failed_message.dart';
import 'package:skelter/presentation/payment_failed/widgets/retry_payment_button.dart';

class PaymentFailedScreen extends StatelessWidget {
  const PaymentFailedScreen({super.key});

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
                  PaymentFailedIcon(),
                  SizedBox(height: 24),
                  PaymentFailedMessage(),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: .min,
            children: [
              RetryPaymentButton(),
              NavigateToHomeScreenButton(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
