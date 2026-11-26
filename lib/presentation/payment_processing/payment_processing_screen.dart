import 'package:material_ui/material_ui.dart';
import 'package:skelter/presentation/payment_processing/widgets/payment_loading_indicator.dart';
import 'package:skelter/presentation/payment_processing/widgets/payment_processing_message.dart';
import 'package:skelter/presentation/payment_processing/widgets/payment_processing_title.dart';

class PaymentProcessingScreen extends StatelessWidget {
  const PaymentProcessingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                PaymentLoadingIndicator(),
                SizedBox(height: 32),
                PaymentProcessingTitle(),
                SizedBox(height: 12),
                PaymentProcessingMessage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
