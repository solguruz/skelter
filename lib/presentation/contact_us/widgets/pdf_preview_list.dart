import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:path/path.dart' as path;
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:skelter/presentation/contact_us/widgets/remove_file_button.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class PdfPreviewList extends StatelessWidget {
  const PdfPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    final pdfs = context.select<ContactUsBloc, List<File>>(
      (bloc) => bloc.state.selectedPdfs ?? [],
    );

    return pdfs.isEmpty
        ? const SizedBox.shrink()
        : SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: pdfs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, index) {
                final pdf = pdfs[index];
                return Stack(
                  children: [
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: context.currentTheme.bgErrorLight50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            TablerIcons.file_type_pdf,
                            color: AppColors.red,
                            size: 28,
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              path.basename(pdf.path),
                              style: AppTextStyles.p4Regular.copyWith(
                                color: context.currentTheme.textNeutralPrimary,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RemoveFileButton(
                      onRemove: (index) => context
                          .read<ContactUsBloc>()
                          .add(RemovePdfEvent(index)),
                      index: index,
                    ),
                  ],
                );
              },
            ),
          );
  }
}
