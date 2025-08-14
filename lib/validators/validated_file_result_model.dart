import 'dart:io';

/// Result model returned after picking and validating files.

class ValidatedFileResultModel {
  final List<File> validFiles;
  final String? error;

  const ValidatedFileResultModel({
    required this.validFiles,
    this.error,
  });

  bool get hasError => error != null;
}
