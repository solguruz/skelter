import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/my_orders/services/pdf_service.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class InvoicePreviewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Uint8List pdfBytes;
  final String fileName;

  const InvoicePreviewAppBar({
    required this.pdfBytes,
    required this.fileName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppButton.icon(
        iconData: TablerIcons.arrow_left,
        iconOrTextColorOverride: context.currentTheme.iconNeutralDefault,
        size: AppButtonSize.extraLarge,
        onPressed: () => context.router.pop(),
      ),
      title: Text(
        context.localization.generate_invoice,
        style: AppTextStyles.h6SemiBold.copyWith(
          color: context.currentTheme.textNeutralPrimary,
        ),
      ),
      centerTitle: true,
      actions: [
        // Use Builder to get the widget context
        Builder(
          builder: (ctx) => AppButton.icon(
            iconData: TablerIcons.share_2,
            iconOrTextColorOverride: context.currentTheme.iconNeutralDefault,
            size: AppButtonSize.extraLarge,
            onPressed: () => _shareInvoice(ctx),
          ),
        ),
      ],
    );
  }

  Future<void> _shareInvoice(BuildContext context) async {
    try {
      final box = context.findRenderObject() as RenderBox?;
      if (box == null) {
        context.showSnackBar(
          context.localization.invoice_share_failed,
          isDisplayingError: true,
        );
        return;
      }
      final sharePositionOrigin = box.localToGlobal(Offset.zero) & box.size;
      await PdfService.sharePdf(pdfBytes, fileName, sharePositionOrigin);
    } catch (e) {
      if (context.mounted) {
        context.showSnackBar(
          context.localization.invoice_share_failed,
          isDisplayingError: true,
        );
      }
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
