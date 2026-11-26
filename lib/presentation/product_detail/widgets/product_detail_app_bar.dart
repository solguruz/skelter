import 'package:auto_route/auto_route.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/product_detail/constant/product_detail_constants.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class ProductDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String category;
  final String productId;

  const ProductDetailAppBar({
    super.key,
    required this.category,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppButton.icon(
        iconData: TablerIcons.arrow_left,
        iconOrTextColorOverride: context.currentTheme.iconNeutralDefault,
        size: AppButtonSize.extraLarge,
        onPressed: () => context.router.maybePop(),
      ),
      title: Text(
        category,
        style: AppTextStyles.h6SemiBold.copyWith(
          color: context.currentTheme.textNeutralPrimary,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            _shareProductLink(context, productId);
          },
          icon: Icon(
            TablerIcons.share,
            color: context.currentTheme.iconNeutralDefault,
          ),
        ),
      ],
    );
  }

  Future<void> _shareProductLink(BuildContext context, String productId) async {
    final productUrl = Uri.https(kHost, '$kProductDetailPath/$productId');

    final shareSubject = context.localization.share_product_subject;
    final shareMessage = context.localization.share_product_message(
      productUrl.toString(),
    );

    await Share.share(shareMessage, subject: shareSubject);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
