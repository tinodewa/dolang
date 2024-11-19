import 'package:dolang/constants/core/assets/image_constant.dart';
import 'package:dolang/features/splash/constants/splash_assets_constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final assetsConstant = SplashAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageConstant.logov12,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
