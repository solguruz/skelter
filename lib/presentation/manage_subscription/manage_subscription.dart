import 'package:auto_route/auto_route.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/manage_subscription/widgets/manage_subscripton_app_bar.dart';
import 'package:skelter/services/subscription_service.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ManageSubscriptionScreen extends StatelessWidget {
  const ManageSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ManageSubscriptionAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.currentTheme.strokeNeutralLight200,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  tileColor: context.currentTheme.bgSurfaceBase2,
                  leading: Icon(
                    TablerIcons.trash,
                    color: context.currentTheme.bgErrorHover,
                  ),
                  title: Text(
                    context.localization.cancel_subscription,
                    style: AppTextStyles.p2Regular.copyWith(
                      color: context.currentTheme.textErrorSecondary,
                    ),
                  ),
                  trailing: Icon(
                    TablerIcons.chevron_right,
                    color: context.currentTheme.iconNeutralDefault,
                  ),
                  onTap: () => _handleManageSubscriptions(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleManageSubscriptions(BuildContext context) async {
    final subscriptionService = SubscriptionService();
    try {
      final url = await subscriptionService.getUserManagementUrl();
      if (url == null || url.isEmpty) {
        if (context.mounted) {
          context.showSnackBar(
            context.localization.subscription_management_url_unavailable,
          );
        }
        return;
      }

      final uri = Uri.tryParse(url);
      if (uri == null) {
        context.showSnackBar(context.localization.subscription_invalid_url);
        return;
      }
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Unexpected error managing subscriptions: $e');
    }
  }
}
