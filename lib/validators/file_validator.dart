import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_skeleton/constants/constants.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

Future<bool> isValidByMimeAndExtension(File file) async {
  try {
    final extension =
        path.extension(file.path).toLowerCase().replaceFirst('.', '');
    final allowedMime = kAllowedFileTypes[extension];
    if (allowedMime == null) {
      return false;
    }

    final header = await file.openRead(0, 16).first;
    final detectedMime = lookupMimeType(file.path, headerBytes: header);

    switch (extension) {
      case kPdf:
        return _isValidPdfFile(header, detectedMime);
      case kDoc:
        return _isValidDocFile(header, detectedMime);
      case kText:
        return _isValidTextFile(detectedMime);
      case kMp4:
        return _isValidMp4File(header, detectedMime);
      default:
        return detectedMime == allowedMime;
    }
  } catch (_) {
    return false;
  }
}

Future<bool> _isValidMp4File(List<int> header, String? detectedMime) async {
  if (detectedMime != kVideoMimeType) {
    return false;
  }
  if (header.length < 16) {
    return false;
  }

  final fileTypeBoxSignature = Uint8List.fromList(header.sublist(4, 8));
  final signatureString = String.fromCharCodes(fileTypeBoxSignature);

  return signatureString == kFileTypeBoxSignature;
}

Future<bool> _isValidPdfFile(List<int> header, String? detectedMime) async {
  if (detectedMime != kPdfMimeType) {
    return false;
  }
  if (header.length < 5) {
    return false;
  }

  final signature = String.fromCharCodes(header.take(5));
  return signature == kPdfFileSignature;
}

Future<bool> _isValidDocFile(List<int> header, String? detectedMime) async {
  if (detectedMime != kDocMimeType) {
    return false;
  }

  final isLegacyDocFormat = _startsWithBytes(header, kDocOleFileSignature);
  return isLegacyDocFormat;
}

Future<bool> _isValidTextFile(String? detectedMime) async {
  return detectedMime == kTextMimeType || detectedMime == null;
}

bool _startsWithBytes(List<int> data, List<int> prefix) {
  if (data.length < prefix.length) return false;
  for (var i = 0; i < prefix.length; i++) {
    if (data[i] != prefix[i]) return false;
  }
  return true;
}
