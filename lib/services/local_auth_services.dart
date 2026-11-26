import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/shared_pref/pref_keys.dart';
import 'package:skelter/shared_pref/prefs.dart';
import 'package:skelter/utils/extensions/date_time_extensions.dart';

/// Authenticates the user using biometric methods
/// (fingerprint, face recognition, pattern, .)
///
/// This is the core security layer that verifies user
/// identity before granting access to protected features or sensitive data.
///
/// **Authentication Flow:**
/// 1. Checks for recent multiple attempts (spam prevention)
/// 2. Verifies device supports biometrics
/// 3. Checks if biometrics are enrolled on device
/// 4. Shows native biometric prompt (Face ID/Touch ID/Fingerprint)
/// 5. Returns authentication result
///
/// **Returns:**
/// - [BiometricAuthStatus.success] - User authenticated successfully
/// - [BiometricAuthStatus.cancelled] - User cancelled or too many
///   recent attempts
/// - [BiometricAuthStatus.notSupported] - Device doesn't support biometrics
/// - [BiometricAuthStatus.notEnrolled] - No biometrics enrolled on device
/// - [BiometricAuthStatus.error] - Authentication error occurred
///

enum BiometricAuthStatus {
  success,
  notSupported,
  notEnrolled,
  cancelled,
  error,
  tooManyAttempts,
}

class LocalAuthService {
  LocalAuthService(this._localAuth);

  final LocalAuthentication _localAuth;

  Future<bool> get isBiometricSupported async {
    try {
      return await _localAuth.isDeviceSupported() &&
          await _localAuth.canCheckBiometrics;
    } catch (e) {
      debugPrint('[LocalAuthService] isBiometricSupported error: $e');
      return false;
    }
  }

  Future<bool> hasRecentMultipleAuthAttempts() async {
    final currentLocalAuthTime = getCurrentDateTime();
    final lastAuthTimestampMillis = await Prefs.getInt(
      PrefKeys.kLastLocalAuthTimestamp,
    );

    final lastLocalAuthTime = lastAuthTimestampMillis != null
        ? DateTime.fromMillisecondsSinceEpoch(lastAuthTimestampMillis)
        : null;

    if (lastLocalAuthTime != null &&
        currentLocalAuthTime.difference(lastLocalAuthTime).inSeconds < 3) {
      return true;
    }

    await Prefs.setInt(
      PrefKeys.kLastLocalAuthTimestamp,
      currentLocalAuthTime.millisecondsSinceEpoch,
    );

    return false;
  }

  Future<List<BiometricType>> _getAvailableBiometricTypes() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } catch (e) {
      debugPrint('[LocalAuthService] _getAvailableBiometricTypes error: $e');
      return [];
    }
  }

  Future<BiometricAuthStatus> authenticate(
    AppLocalizations localization,
  ) async {
    if (await hasRecentMultipleAuthAttempts()) {
      return BiometricAuthStatus.tooManyAttempts;
    }

    if (!await isBiometricSupported) {
      return BiometricAuthStatus.notSupported;
    }

    final biometricTypes = await _getAvailableBiometricTypes();
    if (biometricTypes.isEmpty) {
      return BiometricAuthStatus.notEnrolled;
    }

    try {
      final didAuthenticate = await _localAuth.authenticate(
        localizedReason: localization.biometric_auth_reason_access_app,
        persistAcrossBackgrounding: true,
        authMessages: [
          IOSAuthMessages(cancelButton: localization.cancel),
          AndroidAuthMessages(
            signInTitle: localization.biometric_authentication,
            cancelButton: localization.cancel,
          ),
        ],
      );

      return didAuthenticate
          ? BiometricAuthStatus.success
          : BiometricAuthStatus.cancelled;
    } on LocalAuthException catch (e) {
      return switch (e.code) {
        LocalAuthExceptionCode.noCredentialsSet ||
        LocalAuthExceptionCode.noBiometricsEnrolled ||
        LocalAuthExceptionCode.noBiometricHardware =>
          BiometricAuthStatus.notEnrolled,
        LocalAuthExceptionCode.userCanceled ||
        LocalAuthExceptionCode.systemCanceled =>
          BiometricAuthStatus.cancelled,
        _ => BiometricAuthStatus.error,
      };
    } catch (e) {
      debugPrint('[LocalAuthService] authenticate Error: $e');
      return BiometricAuthStatus.error;
    }
  }
}
