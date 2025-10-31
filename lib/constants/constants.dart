const String kLogFileName = 'app.log';

const kMimeTypeVideo = 'video/';
const kMimeTypeImage = 'image/';
const kSVGWithDot = '.svg';
const kPNGWithDot = '.png';

const  kPdf = 'pdf';
const  kText = 'txt';
const  kDoc = 'doc';
const  kMp4 = 'mp4';

/// MIME types for identifying PDF, TXT, Word DOC, and MP4 files
const kPdfMimeType = 'application/pdf';
const kTextMimeType = 'text/plain';
const kDocMimeType = 'application/msword';
const kVideoMimeType = 'video/mp4';

/// PDF files start with "%PDF-" as a magic number to identify real PDFs, and
/// MP4/ISO media files contain "ftyp" near the header to verify valid media format
const String kPdfFileSignature = '%PDF-';
const String kFileTypeBoxSignature = 'ftyp';

/// Signature bytes that identify a Microsoft OLE Compound File (used by legacy
/// Microsoft Office formats such as `.doc`, `.xls`, `.ppt`).
/// We use this constant for file type detection/validation — e.g., to check
/// whether a given file is a valid legacy Office document before processing.
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

const String kSomethingWentWrong = 'Oops! Something went wrong';

// Chat messaging constants
const String kHeroAnimationPrefix = 'fullscreen_image_0';

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

// Network/SSL pinning constants
const String kConnectionIsNotSecureError = 'Connection is not secure';

// Cache Api Response
const String kApiCache = 'api_cache';

// Date formats
const String kDefaultDateFormat = 'dd-MM-yyyy';
const String kDefaultTimeFormat12Hour = 'hh:mm a';
