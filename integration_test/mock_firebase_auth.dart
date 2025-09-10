import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mocktail/mocktail.dart';

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

class MockUserCredential extends Mock implements UserCredential {
  @override
  User get user => MockUser();
}

class MockUser extends Mock implements User {
  @override
  String get uid => 'mock-user-id';

  @override
  String? get phoneNumber => '9999988888';

  @override
  Future<String> getIdToken([bool forceRefresh = false]) {
    return Future.value('mock-firebase-id-token');
  }
}
