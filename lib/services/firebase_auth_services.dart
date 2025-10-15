import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/delete_account/constants/delete_account_constants.dart';
import 'package:skelter/shared_pref/prefs.dart';
import 'package:skelter/utils/cache_manager.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  int? _phoneResendToken;

  Future<void> verifyFBAuthPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(String) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
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
      return await _firebaseAuth.signInWithEmailAndPassword(
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

  Future<void> sendVerificationEmail({
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    try {
      if (_firebaseAuth.currentUser != null) {
        if (!(_firebaseAuth.currentUser?.emailVerified ?? false)) {
          await _firebaseAuth.currentUser?.sendEmailVerification();
        } else {
          onError(kFirebaseAuthSessionEmailAlreadyInUse);
        }
      } else {
        onError(kSomethingWentWrong);
      }
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
    }
  }

  Future<void> sendFBAuthPasswordResetEmail(
    String email, {
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
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
      return await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
      return null;
    }
  }

  Future<UserCredential?> loginWithGoogle({
    required Function(String, {StackTrace? stackTrace}) onError,
  }) async {
    try {
      await _firebaseAuth.signOut();
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
          await _firebaseAuth.signInWithCredential(cred);
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
          await _firebaseAuth.signInWithCredential(cred);
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
      return await _firebaseAuth.createUserWithEmailAndPassword(
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

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> deleteCurrentUser({
    required Function(String message, {StackTrace? stackTrace}) onError,
  }) async {
    try {
      await _deleteUserAccount();
      await Prefs.clear();
      await sl<CacheManager>().clearCachedApiResponse();
    } on FirebaseAuthException catch (e, stack) {
      if (e.code == kFirebaseAuthRequiresRecentLogin) {
        await _handleRecentLoginRequired(onError);
      } else {
        _handleFirebaseError(e, onError, stackTrace: stack);
      }
    } catch (e, stack) {
      onError(kSomethingWentWrong, stackTrace: stack);
    }
  }

  Future<void> _handleRecentLoginRequired(
    Function(String message, {StackTrace? stackTrace}) onError,
  ) async {
    try {
      await reAuthenticateCurrentUser(onError: onError);
      await _deleteUserAccount();
      await Prefs.clear();
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
    } on Exception catch (e) {
      debugPrint('Error delete account: $e');
      onError(kSomethingWentWrong);
    }
  }

  Future<void> _deleteUserAccount() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) throw Exception('No authenticated user found');
    debugPrint('Attempting account deletion...');
    await user.delete();
    debugPrint('Account deleted successfully.');
  }

  Future<void> reAuthenticateCurrentUser({
    required Function(String message, {StackTrace? stackTrace}) onError,
  }) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      onError('User not found');
      return;
    }

    final providerId = user.providerData.firstOrNull?.providerId;
    if (providerId == null) {
      onError('UnknownAuthProvider');
      return;
    }

    try {
      await _reAuthenticateByProvider(providerId, user, onError);
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
    } catch (e, stack) {
      onError(kSomethingWentWrong, stackTrace: stack);
    }
  }

  Future<void> _reAuthenticateByProvider(
    String providerId,
    User user,
    Function(String message, {StackTrace? stackTrace}) onError,
  ) async {
    try {
      switch (providerId) {
        case kProviderGoogle:
          await _reAuthWithGoogle(user);

        case kProviderPhone:
          onError(kPhoneAuthRequired);

        //Todo : Dynamic Implementation/Test Pending for Email/Password reAuth
        case kProviderPassword:
          onError(kEmailPasswordReAuthRequired);

        default:
          onError('$kUnsupportedProvider: $providerId');
      }
    } on FirebaseAuthException catch (e, stack) {
      _handleFirebaseError(e, onError, stackTrace: stack);
    } catch (e, stack) {
      onError(kSomethingWentWrong, stackTrace: stack);
    }
  }

  //Todo : Dynamic Implementation/Test Pending for _reAuthWithGoogle
  // Re-authenticates with Google credentials
  Future<void> _reAuthWithGoogle(User user) async {
    final googleSignIn = GoogleSignIn(scopes: [kEmailScope]);
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      throw Exception('Google sign-in was cancelled by user');
    }

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await user.reauthenticateWithCredential(credential);
  }

  // Re-authenticates with email and password
  Future<void> reAuthWithEmailPassword({
    required String email,
    required String password,
    required Function(String message, {StackTrace? stackTrace}) onError,
  }) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      onError('User not found');
      return;
    }

    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await user.reauthenticateWithCredential(credential);
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
    // TODO: uncomment to enable crashlytics
    // FirebaseCrashlytics.instance.recordError(
    //   e,
    //   stackTrace ?? StackTrace.current,
    //   reason: 'FirebaseAuth error',
    // );
  }

  String _sha256OfString(String input) {
    final Uint8List bytes = utf8.encode(input);
    final Digest digest = sha256.convert(bytes);
    return digest.toString();
  }
}
