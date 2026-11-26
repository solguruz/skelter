import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart' show XFile;
import 'package:skelter/i18n/app_localizations_en.dart';
import 'package:skelter/utils/file_picker_util.dart';
import 'package:skelter/validators/validated_file_result.dart';

final class _FakePlatformFile extends PlatformFile {
  _FakePlatformFile(this._file);

  final File _file;

  @override
  String get name => _file.uri.pathSegments.last;

  @override
  Uri get uri => _file.uri;

  @override
  XFile get xFile => XFile(_file.path);

  @override
  int? lengthSync() => _file.lengthSync();

  @override
  Future<int?> length() => _file.length();

  @override
  Future<Uint8List> readAsBytes() => _file.readAsBytes();

  @override
  Stream<Uint8List> readAsByteStream() =>
      _file.openRead().map(Uint8List.fromList);
}

class _FakeFilePickerPlatform extends FilePickerPlatform {
  _FakeFilePickerPlatform(this.files);

  final List<PlatformFile> files;
  int pickFileCalls = 0;
  int pickFilesCalls = 0;

  @override
  Future<PlatformFile?> pickFile({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    int compressionQuality = 0,
    AndroidOptions androidOptions = const AndroidOptions(),
    DarwinOptions darwinOptions = const DarwinOptions(),
    WindowsOptions windowsOptions = const WindowsOptions(),
    LinuxOptions linuxOptions = const LinuxOptions(),
    WebOptions webOptions = const WebOptions(),
  }) async {
    pickFileCalls++;
    return files.isEmpty ? null : files.first;
  }

  @override
  Future<List<PlatformFile>> pickFiles({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    int compressionQuality = 0,
    AndroidOptions androidOptions = const AndroidOptions(),
    DarwinOptions darwinOptions = const DarwinOptions(),
    WindowsOptions windowsOptions = const WindowsOptions(),
    LinuxOptions linuxOptions = const LinuxOptions(),
    WebOptions webOptions = const WebOptions(),
  }) async {
    pickFilesCalls++;
    return files;
  }
}

void main() {
  final localizations = AppLocalizationsEn();
  late Directory tempDir;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('file_picker_util_test');
  });

  tearDown(() {
    tempDir.deleteSync(recursive: true);
  });

  File createFile(String name) =>
      File('${tempDir.path}/$name')..writeAsStringSync('content');

  Future<ValidatedFileResult> pick({required bool allowMultiple}) =>
      FilePickerUtil.pickAndValidateFiles(
        localizations: localizations,
        allowedExtensions: ['txt'],
        maxSizeInBytes: 1024,
        maxFiles: 5,
        allowMultiple: allowMultiple,
        isValidFile: (_) async => true,
      );

  test('single pick uses pickFile and returns the picked file', () async {
    final file = createFile('a.txt');
    final platform = _FakeFilePickerPlatform([_FakePlatformFile(file)]);
    FilePickerPlatform.instance = platform;

    final result = await pick(allowMultiple: false);

    expect(platform.pickFileCalls, 1);
    expect(platform.pickFilesCalls, 0);
    expect(result.validFiles.map((f) => f.path), [file.path]);
    expect(result.error, isNull);
  });

  test('multiple pick uses pickFiles and returns every file', () async {
    final first = createFile('a.txt');
    final second = createFile('b.txt');
    final platform = _FakeFilePickerPlatform([
      _FakePlatformFile(first),
      _FakePlatformFile(second),
    ]);
    FilePickerPlatform.instance = platform;

    final result = await pick(allowMultiple: true);

    expect(platform.pickFilesCalls, 1);
    expect(platform.pickFileCalls, 0);
    expect(result.validFiles.map((f) => f.path), [first.path, second.path]);
  });

  test('cancelled pick returns no files and no error', () async {
    FilePickerPlatform.instance = _FakeFilePickerPlatform([]);

    final single = await pick(allowMultiple: false);
    final multiple = await pick(allowMultiple: true);

    expect(single.validFiles, isEmpty);
    expect(single.error, isNull);
    expect(multiple.validFiles, isEmpty);
    expect(multiple.error, isNull);
  });
}
