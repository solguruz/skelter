import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/profile/bloc/profile_bloc.dart';
import 'package:skelter/presentation/profile/bloc/profile_event.dart';
import 'package:skelter/presentation/profile/widgets/divider.dart';
import 'package:skelter/presentation/profile/widgets/manage_subscription.dart';
import 'package:skelter/presentation/profile/widgets/personal_details.dart';
import 'package:skelter/presentation/profile/widgets/upgrade_to_pro.dart';
import 'package:skelter/services/subscription_service.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class AccountSection extends StatefulWidget {
  const AccountSection({super.key});

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  final subscriptionService = SubscriptionService();

  @override
  void initState() {
    super.initState();
    subscriptionService.isUserSubscribed.addListener(_onSubscriptionChange);
  }

  void _onSubscriptionChange() {
    context.read<ProfileBloc>().add(
      UpdateSubscriptionStatusEvent(
        isSubscribed: subscriptionService.isUserSubscribed.value,
      ),
    );
  }

  @override
  void dispose() {
    subscriptionService.isUserSubscribed.removeListener(_onSubscriptionChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          context.localization.account,
          style: AppTextStyles.h6SemiBold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: context.currentTheme.strokeNeutralLight200,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              const PersonalDetails(),
              const ProfileItemsDivider(),
              ValueListenableBuilder<bool>(
                valueListenable: subscriptionService.isUserSubscribed,
                builder: (context, isSubscribed, _) {
                  return isSubscribed
                      ? const ManageSubscription()
                      : const UpgradeToPro();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
