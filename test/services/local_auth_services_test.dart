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
  late MockLocalAuthentication mockLocalAuth;
  late LocalAuthService service;
  final localization = AppLocalizationsEn();

  Future<bool> authenticateCall() => mockLocalAuth.authenticate(
    localizedReason: any(named: 'localizedReason'),
    authMessages: any(named: 'authMessages'),
    persistAcrossBackgrounding: any(named: 'persistAcrossBackgrounding'),
  );

  setUp(() {
    final mockPrefs = MockSharedPreferencesAsync();
    when(() => mockPrefs.getInt(any())).thenAnswer((_) async => null);
    when(() => mockPrefs.setInt(any(), any())).thenAnswer((_) async {});
    Prefs.setMockPrefs(mockPrefs);

    mockLocalAuth = MockLocalAuthentication();
    when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);
    when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => true);
    when(() => mockLocalAuth.getAvailableBiometrics())
        .thenAnswer((_) async => [BiometricType.strong]);

    service = LocalAuthService(mockLocalAuth);
  });

  group('LocalAuthService.authenticate', () {
    test('returns success when authentication succeeds', () async {
      when(authenticateCall).thenAnswer((_) async => true);

      expect(
        await service.authenticate(localization),
        BiometricAuthStatus.success,
      );
    });

    test('returns cancelled when authentication returns false', () async {
      when(authenticateCall).thenAnswer((_) async => false);

      expect(
        await service.authenticate(localization),
        BiometricAuthStatus.cancelled,
      );
    });

    for (final code in [
      LocalAuthExceptionCode.noCredentialsSet,
      LocalAuthExceptionCode.noBiometricsEnrolled,
      LocalAuthExceptionCode.noBiometricHardware,
    ]) {
      test('returns notEnrolled for ${code.name}', () async {
        when(authenticateCall).thenThrow(LocalAuthException(code: code));

        expect(
          await service.authenticate(localization),
          BiometricAuthStatus.notEnrolled,
        );
      });
    }

    for (final code in [
      LocalAuthExceptionCode.userCanceled,
      LocalAuthExceptionCode.systemCanceled,
    ]) {
      test('returns cancelled for ${code.name}', () async {
        when(authenticateCall).thenThrow(LocalAuthException(code: code));

        expect(
          await service.authenticate(localization),
          BiometricAuthStatus.cancelled,
        );
      });
    }

    test('returns error for other LocalAuthException codes', () async {
      when(authenticateCall).thenThrow(
        const LocalAuthException(code: LocalAuthExceptionCode.temporaryLockout),
      );

      expect(
        await service.authenticate(localization),
        BiometricAuthStatus.error,
      );
    });

    test('keeps the prompt alive across app backgrounding', () async {
      when(authenticateCall).thenAnswer((_) async => true);

      await service.authenticate(localization);

      verify(
        () => mockLocalAuth.authenticate(
          localizedReason: localization.biometric_auth_reason_access_app,
          authMessages: any(named: 'authMessages'),
          persistAcrossBackgrounding: true,
        ),
      ).called(1);
    });
  });
}
