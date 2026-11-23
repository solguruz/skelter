import 'package:material_ui/material_ui.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class PaymentFailedIcon extends StatelessWidget {
  const PaymentFailedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: AppColors.redError600,
      child: Icon(
        Icons.close_rounded,
        color: context.currentTheme.bgShadesWhite,
        size: 40,
      ),
    );
  }
}
