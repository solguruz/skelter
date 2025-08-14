// File extensions
const kSVGExtension = '.svg';
const kPNGExtension = '.png';

const kPdf = 'pdf';
const kText = 'txt';
const kDoc = 'doc';
const kMp4 = 'mp4';

/// Currently, only `pdf` files [kAllowedFileExtensions] are used in the app.
/// You can expand this list in the future to support formats like:
/// - `txt`
/// - `doc`
/// - `mp4`

final kAllowedFileExtensions = [
  'pdf',
  // 'txt',
  // 'doc',
  // 'mp4',
];

// MIME types
const kPdfMimeType = 'application/pdf';
const kTextMimeType = 'text/plain';
const kDocMimeType = 'application/msword';
const kVideoMimeType = 'video/mp4';

/// List of acceptable MIME types mapped to their extensions
const Map<String, String> kAllowedFileTypes = {
  kPdf: kPdfMimeType,
  kText: kTextMimeType,
  kDoc: kDocMimeType,
  kMp4: kVideoMimeType,
};

// File signatures (magic numbers)
const String kPdfFileSignature = '%PDF-';
const String kFileTypeBoxSignature = 'ftyp';

/// DOC OLE Compound File Signature
const List<int> kDocOleFileSignature = [
  0xD0,
  0xCF,
  0x11,
  0xE0,
  0xA1,
  0xB1,
  0x1A,
  0xE1,
];

// File limits
const int kMaxFileLimit = 5;
const int kMaxFileSizeInBytes = 5 * 1024 * 1024;

// General app constants
const int kMessageMaxLength = 250;
const String kSomethingWentWrong = 'Oops! Something went wrong';

// Chat messaging constants
const String kHereAnimationPrefix = 'fullscreen_image_0';

// Regex patterns
final kEmailRegex = RegExp(
  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
);

// Firebase Auth exception codes
const kFirebaseAuthWeakPasswordException = 'weak-password';
const kFirebaseAuthUserNotFoundException = 'user-not-found';
const kFirebaseAuthWrongPasswordException = 'wrong-password';
const kFirebaseAuthTooManyRequestsException = 'too-many-requests';
const kFirebaseAuthInvalidCodeException = 'invalid-verification-code';
const kFirebaseAuthSessionExpiredException = 'session-expired';
const kFirebaseAuthSessionEmailAlreadyInUse = 'email-already-in-use';
const kFirebaseAuthRequiresRecentLogin = 'requires-recent-login';
