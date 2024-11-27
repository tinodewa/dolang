import 'package:dolang/features/profile/constants/profile_assets_constant.dart';
import 'package:dolang/features/profile/sub_features/privacy_policy/view/components/dialog_webview_component.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});

  final assetsConstant = ProfileAssetsConstant();
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    analytics.logScreenView(
      screenName: 'privacy Policy Screen',
      screenClass: 'Trainee',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy & Policy'.tr),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse('https://venturo.id'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(
            const DialogWebviewComponent(),
          );
        },
        child: const Icon(Icons.open_in_new),
      ),
    );
  }
}
