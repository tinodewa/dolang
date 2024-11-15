import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

void firebaseAnalyticsPages(FirebaseAnalytics analytics) {
  /// Google analytics untuk tracking user di setiap halaman
  if (Platform.isAndroid) {
    /// Tracking bawah dia masuk screen lupa password di device android
    analytics.logScreenView(
      screenName: 'Forgot Password Screen',
      screenClass: 'Android',
    );
  } else if (Platform.isIOS) {
    /// Tracking bawah dia masuk screen lupa password di device ios
    analytics.logScreenView(
      screenName: 'Forgot Password Screen',
      screenClass: 'IOS',
    );
  } else if (Platform.isMacOS) {
    /// Tracking bawah dia masuk screen lupa password di device macos
    analytics.logScreenView(
      screenName: 'Forgot Password Screen',
      screenClass: 'MacOS',
    );
  }

  if (kIsWeb) {
    /// Tracking bawah dia masuk screen lupa password di device web
    analytics.logScreenView(
      screenName: 'Forgot Password Screen',
      screenClass: 'Web',
    );
  }
}
