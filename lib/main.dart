import 'dart:async';

import 'package:dolang/configs/localizations/localization.dart';
import 'package:dolang/configs/pages/page.dart';
import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/configs/themes/theme.dart';
import 'package:dolang/firebase_options.dart';
import 'package:dolang/shared/bindings/global_binding.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  // RunZoneGuarded untuk menangkap error yang terjadi di dalam aplikasi
  runZonedGuarded(
    () async {
      /// Initialize Flutter
      WidgetsFlutterBinding.ensureInitialized();

      /// Localstorage init
      LocalStorageService().init();

      /// Initialize Firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      /// Initialize Sentry
      await SentryFlutter.init(
        (options) {
          options.dsn =
              'https://9202f7beb6350417b3b98e905e5bd234@o4508052527448064.ingest.us.sentry.io/4508315519614976';
          options.tracesSampleRate = 1.0;
          options.profilesSampleRate = 1.0;
        },
        appRunner: () => runApp(
          const MyApp(),
        ),
      );
    },
    (error, stack) {
      // Capture error dan log ke sentry di bagian ini
      Sentry.captureException(error, stackTrace: stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    analytics.logScreenView(
      screenName: 'MyApp',
    );

    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Localization.defaultLocale,
          fallbackLocale: Localization.fallbackLocale,
          supportedLocales: Localization.locales,
          translations: Localization(),
          title: 'Dolang',
          debugShowCheckedModeBanner: false,
          initialBinding: GlobalBinding(),
          initialRoute: Routes.splashRoute,
          theme: themeLight,
          defaultTransition: Transition.native,
          getPages: Pages.pages,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
