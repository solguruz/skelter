import 'package:skelter/constants/constants.dart';

// Max number of files allowed for uploads
const int kMaxFileLimit = 5;

// Max file size (5 MB)
const int kMaxFileSizeInBytes = 5 * 1024 * 1024;

// Maximum allowed message length (in characters)
const int kMessageMaxLength = 250;

// Allowed file extensions (currently only PDF enabled)
const List<String> kAllowedFileExtensions = [
  kPdfExtension,
  // kTextExtension,
  // kDocExtension,
  // kMp4Extension,
];
