import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/logger/app_logging.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService with Loggable {
  static FirebaseAuthService? _instance = FirebaseAuthService._internal();

  factory FirebaseAuthService() {
    return _instance ??= FirebaseAuthService._internal();
  }
  FirebaseAuthService._internal();

  FirebaseAuth? _firebaseAuth;
  int? _phoneResendToken;

  void init() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  void dispose() {
    _instance = null;
  }

  Future<void> verifyFBAuthPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(String) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    _checkIfInitMethodInitialised();

    await _firebaseAuth?.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      forceResendingToken: _phoneResendToken,
      verificationCompleted: (credential) {
        verificationCompleted(credential);
        _phoneResendToken = null;
      },
      verificationFailed: (FirebaseAuthException e) {
        _handleFirebaseError(e, onError);
        _phoneResendToken = null;
      },
      codeSent: (verificationId, resendToken) {
        codeSent(verificationId);
        _phoneResendToken = resendToken;
      },
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<UserCredential?> signInWithEmailAndPassword(
    String email,
    String password, {
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    try {
      _checkIfInitMethodInitialised();
      return await _firebaseAuth?.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
    } on Exception catch (e) {
      logE('Error signing in with email and password: $e');
      onError(kSomethingWentWrong);
    }
    return null;
  }

  Future<void> sendFBAuthPasswordResetEmail(
    String email, {
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    try {
      _checkIfInitMethodInitialised();
      await _firebaseAuth?.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
    }
  }

  PhoneAuthCredential getPhoneAuthCredential({
    required String verificationId,
    required String smsCode,
  }) {
    return PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
  }

  Future<UserCredential?> signInWithPhoneAuthCredential(
    PhoneAuthCredential credential, {
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    try {
      _checkIfInitMethodInitialised();
      return await _firebaseAuth!.signInWithCredential(credential);
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
      return null;
    }
  }

  Future<UserCredential?> loginWithGoogle({
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    try {
      _checkIfInitMethodInitialised();
      await _firebaseAuth?.signOut();
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>['email'])
              .signIn()
              .catchError((error) {
        logE('Error signing in with Google: $error');
        return null;
      });
      if (googleUser == null) {
        logE('googleUser is null');
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential cred = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential firebaseCred =
          await FirebaseAuth.instance.signInWithCredential(cred);
      return firebaseCred;
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
      return null;
    } catch (e) {
      logE('Error signing in with Google: $e');
      return null;
    }
  }

  Future<UserCredential?> loginWithApple({
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    try {
      final String rawNonce = generateNonce();
      final AuthorizationCredentialAppleID appleCred =
          await SignInWithApple.getAppleIDCredential(
        scopes: <AppleIDAuthorizationScopes>[
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: _sha256OfString(rawNonce),
      );

      logD(
        '''
    APPLE CRED = 
    FAMILY_NAME = ${appleCred.familyName}
    GIVEN NAME = ${appleCred.givenName}
    EMAIL =${appleCred.email}''',
      );
      final OAuthCredential cred = OAuthProvider('apple.com').credential(
        idToken: appleCred.identityToken,
        accessToken: appleCred.authorizationCode,
        rawNonce: rawNonce,
      );

      final UserCredential firebaseCred =
          await FirebaseAuth.instance.signInWithCredential(cred);
      return firebaseCred;
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
      return null;
    } catch (e) {
      logE('Error signing in with Apple: $e');
      return null;
    }
  }

  Future<UserCredential?> signupWithEmailAndPassword(
    String email,
    String password, {
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    try {
      _checkIfInitMethodInitialised();
      return await _firebaseAuth?.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
    } on Exception catch (e) {
      logE('Error signing in with email and password: $e');
      onError(kSomethingWentWrong);
    }
    return null;
  }

  void _handleFirebaseError(
    FirebaseAuthException e,
    Function(String, {StackTrace? stackTrace}) onError, {
    StackTrace? stackTrace,
  }) {
    String errorMessage = 'An error occurred, please try again.';
    switch (e.code) {
      case kFirebaseAuthUserNotFoundException:
        errorMessage = 'No user found with this email.';
      case kFirebaseAuthWrongPasswordException:
        errorMessage =
            'The password you entered is incorrect. Please try again.';
      case kFirebaseAuthWeakPasswordException:
        errorMessage = 'The password you entered is invalid.';
      case kFirebaseAuthTooManyRequestsException:
        errorMessage = 'Too many requests, please try again later.';
      case kFirebaseAuthInvalidCodeException:
        errorMessage = 'Invalid OTP. Please try again.';
      case kFirebaseAuthSessionExpiredException:
        errorMessage = 'Session expired. Please request a new code.';
      case kFirebaseAuthSessionEmailAlreadyInUse:
        errorMessage = 'Email already in use, please login to continue.';
    }
    logE('FirebaseAuth error: $errorMessage');
    onError(errorMessage, stackTrace: stackTrace);
    // TODO: uncommnet to enable crashlytics
    // FirebaseCrashlytics.instance.recordError(
    //   e,
    //   stackTrace ?? StackTrace.current,
    //   reason: 'FirebaseAuth error',
    // );
  }

  void _checkIfInitMethodInitialised() {
    if (_firebaseAuth == null) {
      throw Exception(
        'FirebaseAuthService not initialized. Call init() before using',
      );
    }
  }

  String _sha256OfString(String input) {
    final Uint8List bytes = utf8.encode(input);
    final Digest digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  String get className => (FirebaseAuthService).toString();
}
