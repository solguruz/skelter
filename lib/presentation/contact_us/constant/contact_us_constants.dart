import 'package:skelter/constants/constants.dart';

// Max number of files allowed for uploads
const int kMaxFileLimit = 5;

// Max file size (5 MB)
const int kMaxFileSizeInBytes = 5 * 1024 * 1024;

// Maximum allowed message length (in characters)
const int kMessageMaxLength = 250;

const String kPdfWithDot = kPdf;
const String kTextWithDot = kText;
const String kDocWithDot = kDoc;
const String kMp4WithDot = kMp4;

const List<String> kAllowedFileExtensions = [
  kPdfWithDot,
  // kTextWithDot,
  // kDocWithDot,
  // kMp4WithDot,
];
