import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/validators/validated_file_result.dart';

class FilePickerUtil {
  /// Picks and validates files based on extension, size, and custom logic.
  static Future<ValidatedFileResult> pickAndValidateFiles({
    required AppLocalizations localizations,
    required List<String> allowedExtensions,
    required int maxSizeInBytes,
    required int maxFiles,
    required bool allowMultiple,
    required Future<bool> Function(File file) isValidFile,
  }) async {
    try {
      final pickedFiles = allowMultiple
          ? await FilePicker.pickFiles(
              type: FileType.custom,
              allowedExtensions: allowedExtensions,
            )
          : [
              ?await FilePicker.pickFile(
                type: FileType.custom,
                allowedExtensions: allowedExtensions,
              ),
            ];

      if (pickedFiles.isEmpty) {
        return const ValidatedFileResult(validFiles: []);
      }

      final files = <File>[];

      for (final pickedFile in pickedFiles) {
        final path = pickedFile.path;
        if (path == null) continue;

        final file = File(path);
        final fileSize = await file.length();

        if (fileSize == 0) {
          return ValidatedFileResult(
            validFiles: [],
            error: localizations.file_empty_error,
          );
        }

        if (fileSize > maxSizeInBytes) {
          return ValidatedFileResult(
            validFiles: [],
            error: localizations.file_too_large_error,
          );
        }

        final isValid = await isValidFile(file);

        if (!isValid) {
          return ValidatedFileResult(
            validFiles: [],
            error: localizations.unsupported_file_format_error,
          );
        }

        files.add(file);
      }

      return ValidatedFileResult(validFiles: files.take(maxFiles).toList());
    } catch (_) {
      return ValidatedFileResult(
        validFiles: [],
        error: localizations.pick_file_error,
      );
    }
  }
}
