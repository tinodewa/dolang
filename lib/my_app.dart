import 'package:dolang/configs/localizations/localization.dart';
import 'package:dolang/configs/pages/page.dart';
import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/configs/themes/theme.dart';
import 'package:dolang/shared/bindings/global_binding.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
