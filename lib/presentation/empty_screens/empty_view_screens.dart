import 'package:auto_route/auto_route.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/profile/widgets/divider.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

@RoutePage()
class EmptyViewsScreen extends StatelessWidget {
  const EmptyViewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            TablerIcons.arrow_left,
            color: context.currentTheme.iconNeutralDefault,
          ),
          onPressed: () => context.router.maybePop(),
        ),
        title: Text(
          context.localization.empty_views,
          style: AppTextStyles.h6SemiBold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 24.0),
              Text(
                context.localization.empty_states,
                style: AppTextStyles.h6SemiBold.copyWith(
                  color: context.currentTheme.textNeutralPrimary,
                ),
              ),
              const SizedBox(height: 12.0),
              _buildSection(
                context,
                children: [
                  _buildTile(
                    context,
                    icon: TablerIcons.heart,
                    label: context.localization.wishlist,
                    onTap: () => context.pushRoute(const WishlistRoute()),
                    isFirst: true,
                  ),
                  const ProfileItemsDivider(),
                  _buildTile(
                    context,
                    icon: TablerIcons.shopping_bag,
                    label: context.localization.empty_order_title,
                    onTap: () =>
                        context.pushRoute(const EmptyOrdersViewRoute()),
                  ),
                  const ProfileItemsDivider(),
                  _buildTile(
                    context,
                    icon: TablerIcons.credit_card,
                    label: context.localization.empty_cards_list_title,
                    onTap: () => context.pushRoute(const EmptySavedCardRoute()),
                    isLast: true,
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Text(
                context.localization.error_states,
                style: AppTextStyles.h6SemiBold.copyWith(
                  color: context.currentTheme.textNeutralPrimary,
                ),
              ),
              const SizedBox(height: 12.0),
              _buildSection(
                context,
                children: [
                  _buildTile(
                    context,
                    icon: TablerIcons.server_off,
                    label: context.localization.server_error,
                    onTap: () => context.pushRoute(const ServerErrorRoute()),
                    isFirst: true,
                  ),
                  const ProfileItemsDivider(),
                  _buildTile(
                    context,
                    icon: TablerIcons.tool,
                    label: context.localization.under_maintenance,
                    onTap: () =>
                        context.pushRoute(const UnderMaintenanceRoute()),
                    isLast: true,
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Text(
                context.localization.utilities,
                style: AppTextStyles.h6SemiBold.copyWith(
                  color: context.currentTheme.textNeutralPrimary,
                ),
              ),
              const SizedBox(height: 12.0),
              _buildSection(
                context,
                children: [
                  _buildTile(
                    context,
                    icon: TablerIcons.bell,
                    label: context.localization.schedule_reminder,
                    onTap: () => context.pushRoute(const ReminderRoute()),
                    isFirst: true,
                    isLast: true,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.currentTheme.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isFirst ? 12.0 : 0),
          topRight: Radius.circular(isFirst ? 12.0 : 0),
          bottomLeft: Radius.circular(isLast ? 12.0 : 0),
          bottomRight: Radius.circular(isLast ? 12.0 : 0),
        ),
      ),
      tileColor: context.currentTheme.bgSurfaceBase2,
      leading: Icon(icon, color: context.currentTheme.iconNeutralDefault),
      title: Text(
        label,
        style: AppTextStyles.h6SemiBold.copyWith(
          color: context.currentTheme.textNeutralPrimary,
        ),
      ),
      trailing: Icon(
        TablerIcons.chevron_right,
        color: context.currentTheme.iconNeutralDefault,
      ),
      onTap: onTap,
    );
  }
}
