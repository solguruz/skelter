import 'package:material_ui/material_ui.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class PaymentLoadingIndicator extends StatelessWidget {
  const PaymentLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 80,
        width: 80,
        child: CircularProgressIndicator(
          color: context.currentTheme.bgBrandDefault,
          strokeWidth: 6,
        ),
      ),
    );
  }
}
