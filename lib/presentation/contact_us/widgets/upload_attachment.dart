import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class UploadAttachment extends StatelessWidget {
  const UploadAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    final hasAttachments = context.select<ContactUsBloc, bool>(
      (bloc) =>
          (bloc.state.selectedImages?.isNotEmpty ?? false) ||
          (bloc.state.selectedPdfs?.isNotEmpty ?? false),
    );

    return hasAttachments
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () => _showImageSourceBottomSheet(context),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
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
                  const Icon(
                    TablerIcons.file_upload,
                    color: AppColors.strokeNeutralHover,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.localization.choose_a_file,
                    style: AppTextStyles.p3Medium
                        .withColor(AppColors.textNeutralPrimary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.localization.supported_format,
                    style: AppTextStyles.p4Regular
                        .withColor(AppColors.textNeutralPrimary),
                  ),
                ],
              ),
            ),
          );
  }
}

void _showImageSourceBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 22),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => context.router.maybePop(),
                  child: const Icon(
                    TablerIcons.x,
                    color: AppColors.iconNeutralHover,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              AppButton(
                label: context.localization.take_a_photo,
                shouldSetFullWidth: true,
                style: AppButtonStyle.outline,
                leftIcon: TablerIcons.camera,
                size: AppButtonSize.extraLarge,
                onPressed: () {
                  context.router.maybePop();
                  context.read<ContactUsBloc>().add(
                        const AddImageEvent(source: ImageSource.camera),
                      );
                },
              ),
              const SizedBox(height: 16.0),
              AppButton(
                label: context.localization.upload_from_gallery,
                shouldSetFullWidth: true,
                style: AppButtonStyle.outline,
                leftIcon: TablerIcons.photo,
                size: AppButtonSize.extraLarge,
                onPressed: () {
                  context.router.maybePop();
                  context.read<ContactUsBloc>().add(
                        const AddImageEvent(source: ImageSource.gallery),
                      );
                },
              ),
              const SizedBox(height: 16.0),
              AppButton(
                label: context.localization.upload_from_files,
                shouldSetFullWidth: true,
                style: AppButtonStyle.outline,
                leftIcon: TablerIcons.folders,
                size: AppButtonSize.extraLarge,
                onPressed: () {
                  context.router.maybePop();
                  context.read<ContactUsBloc>().add(const AddPdfEvent());
                },
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      );
    },
  );
}
