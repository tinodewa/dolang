import 'dart:async';

import 'package:dolang/firebase_options.dart';
import 'package:dolang/my_app.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
