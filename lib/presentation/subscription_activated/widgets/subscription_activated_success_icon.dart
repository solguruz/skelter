import 'package:material_ui/material_ui.dart';
import 'package:skelter/gen/assets.gen.dart';

class SubscriptionActivatedSuccessIcon extends StatelessWidget {
  const SubscriptionActivatedSuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.images.success.path,
      height: 80,
      width: 80,
      fit: .cover,
    );
  }
}
