import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class AttachmentErrorDisplay extends StatelessWidget {
  const AttachmentErrorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final pickedFilesError = context.select<ContactUsBloc, String>(
      (bloc) => bloc.state.pickedFilesErrorMessage ?? '',
    );

    return pickedFilesError.isEmpty
        ? const SizedBox.shrink()
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  pickedFilesError,
                  style: AppTextStyles.p4Regular
                      .withColor(AppColors.textErrorSecondary),
                ),
              ),
            ],
          );
  }
}
