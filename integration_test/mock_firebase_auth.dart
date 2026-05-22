import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';

/// A Mocktail-based FirebaseAuth mock.
/// Use this in integration tests to simulate different authentication states.
class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  String? get tenantId => null;

  final _userController = StreamController<User?>.broadcast();
  User? _mockUser;

  @override
  User? get currentUser => _mockUser;

  /// Update the mock user state and notify listeners.
  void setMockUser(User? user) {
    _mockUser = user;
    _userController.add(user);
  }

  @override
  Stream<User?> authStateChanges() =>
      _userController.stream.startWith(_mockUser);

  @override
  Stream<User?> userChanges() => _userController.stream.startWith(_mockUser);

  @override
  Stream<User?> idTokenChanges() => _userController.stream.startWith(_mockUser);

  // Manual override for verifyPhoneNumber because it's callback-heavy
  // and usually doesn't need when() stubbing.
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
  }
}

extension on Stream<User?> {
  Stream<User?> startWith(User? initialValue) async* {
    yield initialValue;
    yield* this;
  }
}

class MockUserCredential extends Mock implements UserCredential {
  MockUserCredential([this._user]);

  final User? _user;

  @override
  User? get user => _user ?? MockUser();
}

class MockUser extends Mock implements User {
  MockUser({String? email, bool emailVerified = false, String? phoneNumber})
    : _email = email,
      _emailVerified = emailVerified,
      _phoneNumber = phoneNumber;

  final String? _email;
  bool _emailVerified;
  final String? _phoneNumber;

  bool sendVerificationShouldFail = false;
  String? sendVerificationError;

  @override
  String? get email => _email;

  @override
  bool get emailVerified => _emailVerified;

  void setEmailVerified({required bool isEmailVerified}) {
    _emailVerified = isEmailVerified;
  }

  @override
  String get uid => 'mock-user-id';

  @override
  String? get phoneNumber => _phoneNumber ?? '9999988888';

  @override
  Future<String> getIdToken([bool forceRefresh = false]) {
    return Future.value('mock-firebase-id-token');
  }

  @override
  Future<void> reload() async {}

  @override
  Future<void> sendEmailVerification([
    ActionCodeSettings? actionCodeSettings,
  ]) async {
    if (sendVerificationShouldFail) {
      throw FirebaseAuthException(
        code: 'too-many-requests',
        message: sendVerificationError ?? 'Failed to send verification',
      );
    }
  }
}

class FakeAuthCredential extends Fake implements AuthCredential {}

/// Mock GoogleSignInAccount
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {
  @override
  final String email;
  final String idToken;

  MockGoogleSignInAccount({
    this.email = 'google@example.com',
    this.idToken = 'mock-id-token',
  }) {
    _mockAuthClient = MockGoogleSignInAuthorizationClient();
  }

  late final MockGoogleSignInAuthorizationClient _mockAuthClient;

  /// Authentication getter with accessToken provided via overridden getter
  @override
  GoogleSignInAuthentication get authentication =>
      _MockGoogleSignInAuthentication(idToken: idToken);

  @override
  String get displayName => 'Mock User';

  @override
  String get id => 'mock-user-id';

  /// Provide mock authorization client
  @override
  GoogleSignInAuthorizationClient get authorizationClient => _mockAuthClient;
}

/// MockGoogleSignInAuthentication to provide accessToken and idToken
class _MockGoogleSignInAuthentication extends GoogleSignInAuthentication {
  final String _idToken;

  const _MockGoogleSignInAuthentication({required String idToken})
    : _idToken = idToken,
      super(idToken: idToken);

  @override
  String? get idToken => _idToken;

  String? get accessToken => 'mock-access-token';
}

/// Mock GoogleSignInAuthorizationClient
class MockGoogleSignInAuthorizationClient extends Mock
    implements GoogleSignInAuthorizationClient {
  @override
  Future<GoogleSignInClientAuthorization> authorizeScopes(
    List<String> scopes,
  ) async {
    return MockGoogleSignInClientAuthorization();
  }
}

/// Mock GoogleSignInClientAuthorization
class MockGoogleSignInClientAuthorization
    implements GoogleSignInClientAuthorization {
  @override
  String get accessToken => 'mock-client-access-token';
}

/// Mock GoogleSignIn
class MockGoogleSignIn extends Mock implements GoogleSignIn {
  bool _isCancelled = false;
  bool _shouldFail = false;

  void setIsCancelled({required bool value}) => _isCancelled = value;

  void setShouldFail({required bool value}) => _shouldFail = value;

  /// Implements authenticate() for GoogleSignIn v7.x API
  @override
  Future<GoogleSignInAccount> authenticate({
    List<String> scopeHint = const <String>[],
  }) async {
    if (_shouldFail) throw Exception('Google sign-in failed');
    if (_isCancelled) throw Exception('User cancelled');
    return MockGoogleSignInAccount();
  }

  @override
  Future<void> signOut() async {}
}

class MockFirebaseAuthService extends Mock
    implements MockFirebaseAuth, MockGoogleSignIn {}
