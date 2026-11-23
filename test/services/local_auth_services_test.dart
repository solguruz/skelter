import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skelter/i18n/app_localizations_en.dart';
import 'package:skelter/services/local_auth_services.dart';
import 'package:skelter/shared_pref/prefs.dart';

class MockLocalAuthentication extends Mock implements LocalAuthentication {}

class MockSharedPreferencesAsync extends Mock
    implements SharedPreferencesAsync {}

void main() {
  late MockLocalAuthentication localAuth;
  late LocalAuthService service;
  final localization = AppLocalizationsEn();

  setUp(() {
    final prefs = MockSharedPreferencesAsync();
    when(() => prefs.getInt(any())).thenAnswer((_) async => null);
    when(() => prefs.setInt(any(), any())).thenAnswer((_) async {});
    Prefs.setMockPrefs(prefs);

    localAuth = MockLocalAuthentication();
    when(localAuth.isDeviceSupported).thenAnswer((_) async => true);
    when(() => localAuth.canCheckBiometrics).thenAnswer((_) async => true);
    when(localAuth.getAvailableBiometrics)
        .thenAnswer((_) async => [BiometricType.strong]);
    service = LocalAuthService(localAuth);
  });

  When<Future<bool>> whenAuthenticate() => when(
    () => localAuth.authenticate(
      localizedReason: any(named: 'localizedReason'),
      authMessages: any(named: 'authMessages'),
      persistAcrossBackgrounding: true,
    ),
  );

  Future<void> expectStatusOnError(
    LocalAuthExceptionCode code,
    BiometricAuthStatus status,
  ) async {
    whenAuthenticate().thenThrow(LocalAuthException(code: code));
    expect(await service.authenticate(localization), status);
  }

  group('LocalAuthService.authenticate', () {
    test('returns success when the user authenticates', () async {
      whenAuthenticate().thenAnswer((_) async => true);
      expect(
        await service.authenticate(localization),
        BiometricAuthStatus.success,
      );
    });

    test('returns cancelled when the user cancels', () async {
      await expectStatusOnError(
        LocalAuthExceptionCode.userCanceled,
        BiometricAuthStatus.cancelled,
      );
    });

    test('returns cancelled when the system cancels', () async {
      await expectStatusOnError(
        LocalAuthExceptionCode.systemCanceled,
        BiometricAuthStatus.cancelled,
      );
    });

    test('returns notEnrolled when no biometrics are enrolled', () async {
      await expectStatusOnError(
        LocalAuthExceptionCode.noBiometricsEnrolled,
        BiometricAuthStatus.notEnrolled,
      );
    });

    test('returns notEnrolled when no passcode is set', () async {
      await expectStatusOnError(
        LocalAuthExceptionCode.noCredentialsSet,
        BiometricAuthStatus.notEnrolled,
      );
    });

    test('returns notEnrolled without biometric hardware', () async {
      await expectStatusOnError(
        LocalAuthExceptionCode.noBiometricHardware,
        BiometricAuthStatus.notEnrolled,
      );
    });

    test('returns error for any other failure', () async {
      await expectStatusOnError(
        LocalAuthExceptionCode.biometricLockout,
        BiometricAuthStatus.error,
      );
    });
  });
}
