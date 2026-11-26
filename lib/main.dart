import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/core/clarity_analytics/clarity_route_observer.dart';
import 'package:skelter/core/deep_link/app_deep_link_manager.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/i18n/i18n.dart';
import 'package:skelter/initialize_app.dart';
import 'package:skelter/routes.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/services/dynamic_icon_service.dart';
import 'package:skelter/services/notification_service.dart';
import 'package:skelter/services/subscription_service.dart';
import 'package:skelter/services/theme_service.dart';
import 'package:skelter/shared_pref/prefs.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/app_flavor_env.dart';
import 'package:skelter/utils/internet_connectivity_helper.dart';
import 'package:skelter/utils/theme/bloc/theme_bloc.dart';
import 'package:skelter/utils/theme/bloc/theme_event.dart';
import 'package:skelter/utils/theme/bloc/theme_state.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  runZonedGuarded(
    () async {
      await initializeApp();
      runApp(const MainApp());
    },
    (error, stack) {
      if (!AppEnvironment.isTestEnvironment && !kIsWeb) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
    },
  );
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

  late ThemeBloc themeBloc;
  StreamSubscription? _notificationSubscription;
  StreamSubscription? _authSubscription;

  @override
  void initState() {
    super.initState();
    Prefs.init();
    _connectivityHelper.onConnectivityChange.addListener(
      handleConnectivityStatusChange,
    );
    _initializeClarity();

    final themeService = ThemeService();
    themeBloc = ThemeBloc(service: themeService)..add(const LoadTheme());

    sl<DynamicIconService>().syncIconFromRemoteConfig();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await sl<AppDeepLinkManager>().initializeDeepLink();
    });

    _authSubscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _initializeNotifications();
      } else {
        _cleanupNotifications();
      }
    });
  }

  Future<void> _initializeNotifications() async {
    await NotificationService.instance.initialize();

    // `authStateChanges()` can fire repeatedly for the same user (token
    // refresh, re-auth, hot restart). Cancel the previous subscription before
    // resubscribing, otherwise the single-subscription `onNotificationTap`
    // stream throws "Stream has already been listened to".
    await _notificationSubscription?.cancel();
    _notificationSubscription = NotificationService.instance.onNotificationTap
        .listen((payload) {
          _handleNotificationTap(payload);
        });

    final initialPayload =
        NotificationService.instance.initialNotificationPayload;
    if (initialPayload != null) {
      _handleNotificationTap(initialPayload);
    }
  }

  Future<void> _cleanupNotifications() async {
    await _notificationSubscription?.cancel();
    _notificationSubscription = null;
    try {
      await FirebaseMessaging.instance.deleteToken();
      debugPrint('FCM token deleted on logout');
    } catch (e) {
      debugPrint('Failed to delete FCM token: $e');
    }
  }

  /// Handles notification taps and navigates based on payload type.
  /// To customize for your app:
  /// Add notification types to constants.dart (e.g., kOrder, kChat)
  void _handleNotificationTap(Map<String, dynamic> payload) {
    debugPrint('Notification tapped with payload: $payload');
    final context = rootNavigatorKey.currentContext;
    if (context == null) {
      debugPrint('Navigation context not available');
      return;
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      debugPrint('User not logged in, ignoring notification navigation');
      return;
    }

    final notificationType = payload['type'] as String?;
    final productId = payload['product_id'] as String?;

    // Customize this switch for your notification types
    switch (notificationType) {
      case kProduct:
        if (productId != null && productId.trim().isNotEmpty) {
          debugPrint('Navigating to product details: $productId');
          context.pushRoute(ProductDetailRoute(productId: productId.trim()));
        } else {
          debugPrint('Product ID missing, navigating to home');
          context.pushRoute(const HomeRoute());
        }
      case kHome:
      default:
        debugPrint('Navigating to home');
        context.pushRoute(const HomeRoute());
    }
  }

  @override
  void dispose() {
    _notificationSubscription?.cancel();
    _authSubscription?.cancel();
    NotificationService.instance.dispose();
    super.dispose();
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
    return BlocProvider.value(
      value: themeBloc,
      child: Sizer(
        builder: (context, orientation, screenType) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
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
                  navigatorObservers: () => [ClarityRouteObserver()],
                ),
                theme: AppThemesData.themeData[AppThemeEnum.LightTheme]!,
                darkTheme: AppThemesData.themeData[AppThemeEnum.DarkTheme]!,
                themeMode: state.themeMode,
                builder: (context, child) {
                  final localization = AppLocalizations.of(context)!;
                  SubscriptionService().setLocalization(localization);
                  return child!;
                },
              );
            },
          );
        },
      ),
    );
  }
}
