// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBmMYIJ95d-5lMoxkXySToGgBnKx3psPwc',
    appId: '1:705642506461:web:331ee38dc4179742a1d334',
    messagingSenderId: '705642506461',
    projectId: 'dolang-2de3c',
    authDomain: 'dolang-2de3c.firebaseapp.com',
    storageBucket: 'dolang-2de3c.firebasestorage.app',
    measurementId: 'G-3GVHLQQ08V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNdqu7Z1HLYhLYnagdE9uqVsLnQsGDOgM',
    appId: '1:705642506461:android:0c34c7fb4d94143fa1d334',
    messagingSenderId: '705642506461',
    projectId: 'dolang-2de3c',
    storageBucket: 'dolang-2de3c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNzWWRaIU41CMXw6MxKFMZCMd7jIZ7NAQ',
    appId: '1:705642506461:ios:e108e4dcafc7b895a1d334',
    messagingSenderId: '705642506461',
    projectId: 'dolang-2de3c',
    storageBucket: 'dolang-2de3c.firebasestorage.app',
    iosBundleId: 'com.hit.dolang',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNzWWRaIU41CMXw6MxKFMZCMd7jIZ7NAQ',
    appId: '1:705642506461:ios:69b0aeac75495315a1d334',
    messagingSenderId: '705642506461',
    projectId: 'dolang-2de3c',
    storageBucket: 'dolang-2de3c.firebasestorage.app',
    iosBundleId: 'com.example.dolang',
  );
}
