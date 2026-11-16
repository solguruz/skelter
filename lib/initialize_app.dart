import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/firebase_options_dev.dart' as dev;
import 'package:skelter/firebase_options_prod.dart' as prod;
import 'package:skelter/firebase_options_stage.dart' as stage;
import 'package:skelter/services/ai/gemini_service.dart';
import 'package:skelter/services/firebase_auth_services.dart';
import 'package:skelter/services/notification_service.dart';
import 'package:skelter/services/performance_monitoring_service.dart';
import 'package:skelter/services/remote_config_service.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/app_flavor_env.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> initializeApp({
  FirebaseAuth? firebaseAuth,
  GoogleSignIn? googleSignIn,
  FirebaseAuthService? firebaseAuthService,
  Dio? dio,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  // Precache `liquid_glass_widgets` shader to avoid a first-paint white flash.
  await LiquidGlassWidgets.initialize();
  tz.initializeTimeZones();

  final firebaseOptions = switch (AppConfig.appFlavor) {
    AppFlavor.dev => dev.DefaultFirebaseOptions.currentPlatform,
    AppFlavor.prod => prod.DefaultFirebaseOptions.currentPlatform,
    AppFlavor.stage => stage.DefaultFirebaseOptions.currentPlatform,
  };

  await Firebase.initializeApp(options: firebaseOptions);

  // Firebase AI Logic attaches an App Check token to every request. Without
  // activate() the native SDK sends a placeholder token that the backend
  // rejects ("Firebase App Check token is invalid").
  // Debug builds use the debug provider: on first launch the native SDK logs
  // a debug secret, which must be added in Firebase Console → App Check →
  // Apps → Manage debug tokens.
  if (!AppEnvironment.isTestEnvironment && !kIsWeb) {
    await FirebaseAppCheck.instance.activate(
      providerAndroid: kDebugMode
          ? const AndroidDebugProvider()
          : const AndroidPlayIntegrityProvider(),
      providerApple: kDebugMode
          ? const AppleDebugProvider()
          : const AppleAppAttestWithDeviceCheckFallbackProvider(),
    );
  }

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
    !kDebugMode,
  );

  final bool isTestEnvironment = AppEnvironment.isTestEnvironment;

  if (!isTestEnvironment && !kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  final remoteConfigService = RemoteConfigService();
  await remoteConfigService.initialize();

  await SystemChrome.setPreferredOrientations([.portraitUp, .portraitDown]);

  await dotenv.load();

  await configureDependencies(
    firebaseAuth: firebaseAuth,
    googleSignIn: googleSignIn,
    firebaseAuthService: firebaseAuthService,
    dio: dio,
  );
  await sl<PerformanceMonitoringService>().initialize();

  try {
    sl<GeminiService>().initialize();
  } catch (e) {
    debugPrint('[Gemini] Initialization warning: $e');
  }

  await GoogleSignIn.instance.initialize();
}
