import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/force_update/bloc/force_update_bloc.dart';
import 'package:skelter/presentation/force_update/bloc/force_update_state.dart';
import 'package:skelter/presentation/force_update/widget/skip_update_button.dart';
import 'package:skelter/presentation/force_update/widget/update_now_button.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

@RoutePage()
class ForceUpdateScreen extends StatelessWidget {
  final bool isMandatoryUpdate;

  const ForceUpdateScreen({
    super.key,
    required this.isMandatoryUpdate,
  });

  static const kHorizontalPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForceUpdateBloc>(
      create: (_) => ForceUpdateBloc(
        isMandatoryUpdate: isMandatoryUpdate,
      ),
      child: BlocListener<ForceUpdateBloc, ForceUpdateState>(
        listener: (context, state) => _listenStateChanged(context, state),
        child: const ForceUpdateScreenBody(),
      ),
    );
  }

  void _listenStateChanged(BuildContext context, ForceUpdateState state) {
    if (state is SkipUpdateState) {
      context.router.maybePopTop(true);
    }
  }
}

class ForceUpdateScreenBody extends StatelessWidget {
  const ForceUpdateScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ForceUpdateScreen.kHorizontalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(
                Assets.icons.forceUpdate,
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 24),
              Text(
                context.localization.its_time_to_update,
                style: AppTextStyles.p1SemiBold
                    .copyWith(color: context.currentTheme.textNeutralPrimary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                context.localization.update_required_description,
                style: AppTextStyles.p3Regular
                    .copyWith(color: context.currentTheme.textNeutralSecondary),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const UpdateNowButton(),
              const SizedBox(height: 10),
              const SkipUpdateButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
