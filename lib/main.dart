import 'package:country_picker/country_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_skeleton/firebase_options.dart';
import 'package:flutter_skeleton/i18n/i18n.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/routes.dart';
import 'package:flutter_skeleton/shared_pref/prefs.dart';
import 'package:flutter_skeleton/widgets/styling/app_theme_data.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  // final Function originalOnError = FlutterError.onError!;
  // FlutterError.onError = (FlutterErrorDetails errorDetails) async {
  //   // TODO: uncomment to enable crashlytics
  //   // if (!kDebugMode) {
  //   //   await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  //   // }
  //   originalOnError(errorDetails);
  //   // Pass all uncaught asynchronous errors that aren't handled by the
  //   // Flutter framework to Crashlytics
  //   // TODO: uncomment to enable crashlytics
  //   // PlatformDispatcher.instance.onError = (error, stack) {
  //   //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   //   return true;
  //   // };
  // };
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AppRouter appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    Prefs.init();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          supportedLocales: I18n.all,
          localizationsDelegates: const <LocalizationsDelegate>[
            AppLocalizations.delegate,
            CountryLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          routerConfig: appRouter.config(),
          theme: AppThemesData.themeData[AppThemeEnum.LightTheme]!,
        );
      },
    );
  }
}
