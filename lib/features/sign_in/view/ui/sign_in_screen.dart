import 'dart:io';

import 'package:dolang/constants/core/assets/image_constant.dart';
import 'package:dolang/features/sign_in/constants/sign_in_assets_constant.dart';
import 'package:dolang/features/sign_in/view/components/button_login_component.dart';
import 'package:dolang/features/sign_in/view/components/button_social_media_login_component.dart';
import 'package:dolang/features/sign_in/view/components/divider_login_method_component.dart';
import 'package:dolang/features/sign_in/view/components/form_sign_in_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final assetsConstant = SignInAssetsConstant();
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  @override
  Widget build(BuildContext context) {
    analytics.logScreenView(
      screenName: 'Sign In Screen',
      screenClass: 'Entry',
    );

    return Scaffold(
      appBar: null,
      extendBody: false,
      backgroundColor: ColorStyle.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 1.sw,
              height: 310.h,
              child: Image.asset(
                ImageConstant.bromoView,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                left: 20.w,
                right: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Petualanganmu Dimulai di Sini!'.tr,
                    style: GoogleTextStyle.fw600.copyWith(
                      fontSize: 20.sp,
                      color: ColorStyle.blackDark,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 30.h),
                  const FormSignInComponent(),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Get.toNamed(Routes.forgotPasswordRoute);
                      },
                      child: Text(
                        'Lupa password?'.tr,
                        style: GoogleTextStyle.fw600.copyWith(
                          fontSize: 14.sp,
                          color: ColorStyle.blackMedium,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ButtonLoginComponent(
                    buttonText: 'Masuk'.tr,
                  ),
                  SizedBox(height: 30.h),
                  const DividerLoginMethodComponent(),
                  SizedBox(height: 20.h),
                  const ButtonSocialMediaLoginComponent(
                    buttonText: 'Google',
                  ),
                  if (Platform.isIOS) ...{
                    SizedBox(height: 20.h),
                    const ButtonSocialMediaLoginComponent(
                      buttonText: 'Apple',
                    ),
                  },
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun?'.tr,
                        style: GoogleTextStyle.fw600.copyWith(
                          fontSize: 14.sp,
                          color: ColorStyle.blackMedium,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(width: 4.h),
                      GestureDetector(
                        onTap: () {
                          // Get.toNamed(Routes.forgotPasswordRoute);
                        },
                        child: Text(
                          'Daftar'.tr,
                          style: GoogleTextStyle.fw600.copyWith(
                            fontSize: 14.sp,
                            color: ColorStyle.primaryDark,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
