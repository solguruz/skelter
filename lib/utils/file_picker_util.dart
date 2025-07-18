import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FileValidationResult {
  final List<File> validFiles;
  final String? error;

  const FileValidationResult({
    required this.validFiles,
    this.error,
  });

  bool get hasError => error != null;
}

class FilePickerUtil {
  /// Picks and validates files based on extension, size, and custom logic.
  static Future<FileValidationResult> pickAndValidateFiles({
    required AppLocalizations localizations,
    required List<String> allowedExtensions,
    required int maxSizeInBytes,
    required int maxFiles,
    required bool allowMultiple,
    Future<bool> Function(File file)? isValidFile,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        allowMultiple: allowMultiple,
      );

      if (result == null || result.paths.isEmpty) {
        return const FileValidationResult(validFiles: []);
      }

      final files = <File>[];

      for (final path in result.paths) {
        if (path == null) continue;

        final file = File(path);
        final fileSize = await file.length();

        if (fileSize == 0) {
          return FileValidationResult(
            validFiles: [],
            error: localizations.file_empty_error,
          );
        }

        if (fileSize > maxSizeInBytes) {
          return FileValidationResult(
            validFiles: [],
            error: localizations.file_too_large_error,
          );
        }

        if (isValidFile != null && !await isValidFile(file)) {
          return FileValidationResult(
            validFiles: [],
            error: localizations.unsupported_file_format_error,
          );
        }

        files.add(file);
      }

      return FileValidationResult(
        validFiles: files.take(maxFiles).toList(),
      );
    } catch (_) {
      return FileValidationResult(
        validFiles: [],
        error: localizations.pick_pdf_error,
      );
    }
  }
}
