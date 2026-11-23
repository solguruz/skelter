import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/shared_pref/prefs.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

// Service to manage the app tour
class AppTourService {
  static const String _tourCompletedKey = 'app_tour_completed';
  static TutorialCoachMark? _activeTutorial;
  static bool _isDismissing = false;

  static Future<bool> isTourCompleted() async {
    return await Prefs.getBool(_tourCompletedKey) ?? false;
  }

  static Future<void> markTourAsCompleted() async {
    await Prefs.setBool(_tourCompletedKey, value: true);
  }

  /// Dismisses the currently active tour without marking it as completed.
  static void dismissTour() {
    _isDismissing = true;
    _activeTutorial?.finish();
    _activeTutorial = null;
    _isDismissing = false;
  }

  // Create and show the app tour
  static void showTour({
    required BuildContext context,
    required GlobalKey searchBarKey,
    required GlobalKey bottomNavKey,
  }) {
    final targets = _createTargets(
      context: context,
      searchBarKey: searchBarKey,
      bottomNavKey: bottomNavKey,
    );

    final tutorial = TutorialCoachMark(
      hideSkip: true,
      targets: targets,
      paddingFocus: 4,
      onFinish: () {
        _activeTutorial = null;
        if (!_isDismissing) markTourAsCompleted();
      },
      onSkip: () {
        _activeTutorial = null;
        if (!_isDismissing) markTourAsCompleted();
        return true;
      },
    );

    _activeTutorial = tutorial;
    tutorial.show(context: context);
  }

  static List<TargetFocus> _createTargets({
    required BuildContext context,
    required GlobalKey searchBarKey,
    required GlobalKey bottomNavKey,
  }) {
    return [
      TargetFocus(
        identify: context.localization.search_bar_identify,
        keyTarget: searchBarKey,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        radius: 12,
        contents: [
          TargetContent(
            builder: (context, controller) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      context.localization.tour_search_title,
                      style: AppTextStyles.h2Bold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      context.localization.tour_search_description,
                      style: AppTextStyles.p2Regular.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: .end,
                      children: [
                        AppButton(
                          onPressed: () => controller.skip(),
                          label: context.localization.skip,
                          style: AppButtonStyle.textOrIcon,
                          foregroundColor: AppColors.white,
                        ),
                        const SizedBox(width: 16),
                        AppButton(
                          onPressed: () => controller.next(),
                          label: context.localization.next,
                          foregroundColor: AppColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: context.localization.bottom_nav__bar_identify,
        keyTarget: bottomNavKey,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        radius: 12,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      context.localization.tour_nav_title,
                      style: AppTextStyles.h2Bold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      context.localization.tour_nav_description,
                      style: AppTextStyles.p2Regular.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: .end,
                      children: [
                        AppButton(
                          onPressed: () => controller.next(),
                          label: context.localization.got_it,
                          foregroundColor: AppColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ];
  }
}
