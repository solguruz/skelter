import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

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
                  style: AppTextStyles.p4Regular.copyWith(
                    color: context.currentTheme.textErrorSecondary,
                  ),
                ),
              ),
            ],
          );
  }
}
