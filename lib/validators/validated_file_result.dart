import 'dart:io';

/// Result model returned after picking and validating files.

class ValidatedFileResult {
  final List<File> validFiles;
  final String? error;

  const ValidatedFileResult({
    required this.validFiles,
    this.error,
  });

  bool get hasError => error != null;
}
