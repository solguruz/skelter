import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:skelter/core/clarity_analytics/clarity_route_observer.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/i18n/i18n.dart';
import 'package:skelter/initialize_app.dart';
import 'package:skelter/routes.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/shared_pref/prefs.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/app_flavor_env.dart';
import 'package:skelter/utils/internet_connectivity_helper.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  runZonedGuarded(() async {
    await initializeApp();
    runApp(const MainApp());
  }, (error, stack) {
    if (!AppEnvironment.isTestEnvironment && !kIsWeb) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
  });
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AppRouter appRouter = AppRouter();
  final InternetConnectivityHelper _connectivityHelper =
      InternetConnectivityHelper();

  @override
  void initState() {
    super.initState();
    Prefs.init();
    _connectivityHelper.onConnectivityChange
        .addListener(handleConnectivityStatusChange);
    _initializeClarity();
  }

  Future<void> handleConnectivityStatusChange() async {
    final isConnected = _connectivityHelper.onConnectivityChange.value;
    await Future.delayed(const Duration(milliseconds: 300));

    if (!isConnected) {
      final stillDisconnected = !_connectivityHelper.onConnectivityChange.value;
      if (!stillDisconnected) return;
      await rootNavigatorKey.currentContext!.pushRoute(const NoInternetRoute());
    } else {
      dismissConnectivityPopup();
    }
  }

  void dismissConnectivityPopup() {
    final navigator = Navigator.of(rootNavigatorKey.currentContext!);
    if (navigator.canPop()) {
      navigator.pop();
    }
  }

  void _initializeClarity() {
    final projectId = AppConfig.getClarityProjectId();

    if (projectId.isEmpty ||
        AppEnvironment.isTestEnvironment ||
        AppConfig.appFlavor == AppFlavor.dev ||
        kIsWeb) {
      debugPrint(
        'Clarity not initialized for flavor: '
            '${AppConfig.appFlavor.name} or in test environment',
      );
      return;
    }

    final config = ClarityConfig(projectId: projectId);
    Clarity.initialize(context, config);
  }



  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          supportedLocales: I18n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            CountryLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          routerConfig: appRouter.config(
            navigatorObservers: () => [
              ClarityRouteObserver(),
            ],
          ),
          theme: AppThemesData.themeData[AppThemeEnum.LightTheme]!,
        );
      },
    );
  }
}
