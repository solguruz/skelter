import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/home/bloc/home_bloc.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchQuery = context.select<HomeBloc, String>(
      (bloc) => bloc.state.searchQuery,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.icons.userNotFound,
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 24),
          Text(
            context.localization.no_result_for(searchQuery),
            style: AppTextStyles.p1SemiBold
                .copyWith(color: context.currentTheme.textNeutralPrimary),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          Text(
            context.localization.no_search_result_message,
            style: AppTextStyles.p2Regular
                .copyWith(color: context.currentTheme.textNeutralSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
