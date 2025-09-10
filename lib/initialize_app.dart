import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/firebase_options_dev.dart' as dev;
import 'package:skelter/firebase_options_prod.dart' as prod;
import 'package:skelter/firebase_options_stage.dart' as stage;
import 'package:skelter/services/remote_config_service.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/app_flavor_env.dart';

Future<void> initializeApp({FirebaseAuth? firebaseAuth, Dio? dio}) async {
  WidgetsFlutterBinding.ensureInitialized();

  final firebaseOptions = switch (AppConfig.appFlavor) {
    AppFlavor.dev => dev.DefaultFirebaseOptions.currentPlatform,
    AppFlavor.prod => prod.DefaultFirebaseOptions.currentPlatform,
    AppFlavor.stage => stage.DefaultFirebaseOptions.currentPlatform,
  };

  await Firebase.initializeApp(options: firebaseOptions);

  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(!kDebugMode);

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

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load();

  await configureDependencies(firebaseAuth: firebaseAuth, dio: dio);
}
