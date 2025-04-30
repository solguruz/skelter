import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

Widget contactUsUploadFiles(BuildContext context) {
  return GestureDetector(
    onTap: () => context.read<ContactUsBloc>().add(const AddImageEvent()),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: const DashedBorder.fromBorderSide(
          dashLength: 6,
          side: BorderSide(color: AppColors.strokeNeutralDisabled),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.icons.fileUpload),
          const SizedBox(height: 8),
          Text(
            context.l10n.choose_a_file,
            style:
                AppTextStyles.p3Medium.withColor(AppColors.textNeutralPrimary),
          ),
          const SizedBox(height: 4),
          Text(
            context.l10n.supported_format,
            style:
                AppTextStyles.p4Regular.withColor(AppColors.textNeutralPrimary),
          ),
        ],
      ),
    ),
  );
}
