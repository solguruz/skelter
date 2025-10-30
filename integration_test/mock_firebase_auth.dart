import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/services/firebase_auth_services.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  String? get tenantId => null;

  @override
  Stream<User?> authStateChanges() => Stream.value(null);

  final MockUser _mockUser = MockUser();

  @override
  User? get currentUser => _mockUser;

  @override
  Future<void> verifyPhoneNumber({
    String? phoneNumber,
    PhoneMultiFactorInfo? multiFactorInfo,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    @visibleForTesting String? autoRetrievedSmsCodeForTesting,
    Duration timeout = const Duration(seconds: 30),
    int? forceResendingToken,
    MultiFactorSession? multiFactorSession,
  }) async {
    debugPrint('Mock verifyPhoneNumber called with phone: $phoneNumber');

    const String mockVerificationId = 'mock-verification-id';
    codeSent(mockVerificationId, 123456);

    // You can also simulate auto-verification if needed
    // final credential = PhoneAuthProvider.credential(
    //   verificationId: mockVerificationId,
    //   smsCode: '123456'
    // );
    // verificationCompleted(credential);
  }

  @override
  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    debugPrint('Mock signInWithCredential called');
    return MockUserCredential();
  }
}

class MockFirebaseAuthService extends Mock implements FirebaseAuthService {
  bool signInWithEmailShouldFail = false;
  String signInWithEmailError = 'Invalid email or password';
  User? signInWithEmailUser;
  String? signInWithEmailUserEmail;
  bool? signInWithEmailUserVerified;

  bool sendVerificationShouldFail = false;
  String sendVerificationError = 'Failed to send verification';

  bool resetPasswordShouldFail = false;
  String resetPasswordError = 'Invalid email';

  bool loginWithGoogleShouldFail = false;
  String loginWithGoogleError = 'Google sign-in failed';

  bool loginWithAppleShouldFail = false;
  String loginWithAppleError = 'Apple sign-in failed';

  @override
  Future<void> verifyFBAuthPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(String) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    codeSent('mock_verification_id');
  }

  @override
  Future<UserCredential?> signInWithEmailAndPassword(
    String email,
    String password, {
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    if (signInWithEmailShouldFail) {
      onError(signInWithEmailError);
      return null;
    }
    final user = signInWithEmailUser ??
        (signInWithEmailUserEmail != null || signInWithEmailUserVerified != null
            ? MockUser(
                email: signInWithEmailUserEmail,
                emailVerified: signInWithEmailUserVerified ?? false,
              )
            : null);
    return MockUserCredential(user);
  }

  @override
  Future<void> sendVerificationEmail({
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    if (sendVerificationShouldFail) {
      onError(sendVerificationError);
    }
  }

  @override
  Future<void> sendFBAuthPasswordResetEmail(
    String email, {
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    if (resetPasswordShouldFail) {
      onError(resetPasswordError);
    }
  }

  @override
  Future<UserCredential?> loginWithGoogle({
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    if (loginWithGoogleShouldFail) {
      onError(loginWithGoogleError);
      return null;
    }
    return MockUserCredential(MockUser(email: 'google@example.com'));
  }

  @override
  Future<UserCredential?> loginWithApple({
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    if (loginWithAppleShouldFail) {
      onError(loginWithAppleError);
      return null;
    }
    return MockUserCredential(MockUser(email: 'apple@example.com'));
  }
}

class MockUserCredential extends Mock implements UserCredential {
  MockUserCredential([this._user]);

  final User? _user;

  @override
  User? get user => _user ?? MockUser();
}

class MockUser extends Mock implements User {
  MockUser({String? email, bool emailVerified = false})
      : _email = email,
        _emailVerified = emailVerified;

  final String? _email;
  final bool _emailVerified;

  @override
  String? get email => _email;

  @override
  bool get emailVerified => _emailVerified;

  @override
  String get uid => 'mock-user-id';

  @override
  String? get phoneNumber => '9999988888';

  @override
  Future<String> getIdToken([bool forceRefresh = false]) {
    return Future.value('mock-firebase-id-token');
  }
}
