import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
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
      final List<PlatformFile> pickedFiles;
      if (allowMultiple) {
        pickedFiles = await FilePicker.pickFiles(
          type: FileType.custom,
          allowedExtensions: allowedExtensions,
        );
      } else {
        final pickedFile = await FilePicker.pickFile(
          type: FileType.custom,
          allowedExtensions: allowedExtensions,
        );
        pickedFiles = [if (pickedFile != null) pickedFile];
      }

      if (pickedFiles.isEmpty) {
        return const ValidatedFileResult(validFiles: []);
      }

      final files = <File>[];

      for (final pickedFile in pickedFiles) {
        final file = await _toLocalFile(pickedFile);
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

  /// Returns a [File] on local disk for [pickedFile].
  ///
  /// Since file_picker 12, a picked file may only be reachable through a
  /// non-file URI (e.g. Android `content://`), in which case [PlatformFile.path]
  /// is null. Such files are copied into the temporary directory.
  static Future<File> _toLocalFile(PlatformFile pickedFile) async {
    final path = pickedFile.path;
    if (path != null) return File(path);

    final tempDir = await getTemporaryDirectory();
    final localPath = '${tempDir.path}/'
        '${DateTime.now().microsecondsSinceEpoch}_${pickedFile.name}';
    await pickedFile.xFile.saveTo(localPath);
    return File(localPath);
  }
}
