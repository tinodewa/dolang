import 'dart:async';

import 'package:dolang/firebase_options.dart';
import 'package:dolang/my_app.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
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

      // You may set the permission requests to "provisional" which allows the user to choose what type
      // of notifications they would like to receive once the user receives a notification.
      final notificationSettings =
          await FirebaseMessaging.instance.requestPermission(provisional: true);

      final fcmToken = await FirebaseMessaging.instance.getToken();
      print('FCM Token $fcmToken');

      // Get any messages which caused the application to open from
      // a terminated state.
      RemoteMessage? initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();

      // If the message also contains a data property with a "type" of "chat",
      // navigate to a chat screen
      if (initialMessage != null) {
        _handleMessage(initialMessage);
      }

      // Also handle any interaction when the app is in the background via a
      // Stream listener
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

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

void _handleMessage(RemoteMessage message) {
  print('ada');
  print('halo ${message.data}');
  if (message.data['type'] == 'chat') {
    print('halo ${message.data['type']}');
  }
}
