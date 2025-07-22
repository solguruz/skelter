import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/shared_pref/prefs.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService {
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
      debugPrint('Error signing in with email and password: $e');
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
        debugPrint('Error signing in with Google: $error');
        return null;
      });
      if (googleUser == null) {
        debugPrint('googleUser is null');
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
      debugPrint('Error signing in with Google: $e');
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

      debugPrint(
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
      debugPrint('Error signing in with Apple: $e');
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
      debugPrint('Error signing in with email and password: $e');
      onError(kSomethingWentWrong);
    }
    return null;
  }

  Future<void> signOut() async {
    await _firebaseAuth?.signOut();
  }

  Future<void> deleteCurrentUser({
    required Function(String message, {StackTrace? stackTrace}) onError,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.delete();
      await Prefs.clear();
    } on FirebaseAuthException catch (e, stack) {
      debugPrint('FirebaseAuthException: ${e.code}');
      if (e.code == kFirebaseAuthRequiresRecentLogin) {
        await reAuthenticateCurrentUser(onError: onError);
        try {
          final user = FirebaseAuth.instance.currentUser;
          await user?.delete();
          await Prefs.clear();
        } on FirebaseAuthException catch (e2, stack2) {
          _handleFirebaseError(e2, onError, stackTrace: stack2);
        } on Exception catch (e2) {
          debugPrint('Error delete account after reauth: $e2');
          onError(kSomethingWentWrong);
        }
        return;
      }
      _handleFirebaseError(e, onError, stackTrace: stack);
    } on Exception catch (e) {
      debugPrint('Error delete account: $e');
      onError(kSomethingWentWrong);
    }
  }

  Future<void> reAuthenticateCurrentUser({
    required Function(String message, {StackTrace? stackTrace}) onError,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      final providerId = user?.providerData.firstOrNull?.providerId;
      if (providerId == null) {
        onError('UnknownAuthProvider');
        return;
      }
      if (providerId == AppleAuthProvider().providerId) {
        final String rawNonce = generateNonce();
        final AuthorizationCredentialAppleID appleCred =
            await SignInWithApple.getAppleIDCredential(
          scopes: <AppleIDAuthorizationScopes>[
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          nonce: _sha256OfString(rawNonce),
        );
        final OAuthCredential credential =
            OAuthProvider('apple.com').credential(
          idToken: appleCred.identityToken,
          accessToken: appleCred.authorizationCode,
          rawNonce: rawNonce,
        );
        await user?.reauthenticateWithCredential(credential);
      } else if (providerId == GoogleAuthProvider().providerId) {
        final GoogleSignInAccount? googleUser =
            await GoogleSignIn(scopes: <String>['email']).signIn();
        if (googleUser == null) {
          onError('Google sign-in aborted');
          return;
        }
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await user?.reauthenticateWithCredential(credential);
      } else {
        onError('UnsupportedProvider');
        return;
      }
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
    } on Exception catch (e) {
      debugPrint('Reauth error $e');
      onError(kSomethingWentWrong);
    }
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
    debugPrint('FirebaseAuth error: $errorMessage');
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
}
