import 'package:dolang/features/sign_up/constants/sign_up_assets_constant.dart';
import 'package:dolang/features/sign_up/controllers/sign_up_controller.dart';
import 'package:dolang/features/sign_up/view/components/button_sign_up_component.dart';
import 'package:dolang/features/sign_up/view/components/form_sign_up_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final assetsConstant = SignUpAssetsConstant();
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    analytics.logScreenView(
      screenName: 'Sign Up Screen',
      screenClass: 'Entry',
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorStyle.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(13.r),
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: ColorStyle.secondary,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorStyle.blackDark,
                  size: 21.sp,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
          title: Text(
            'Siapkan akun Anda'.tr,
            style: GoogleTextStyle.fw600.copyWith(
              fontSize: 20.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: ColorStyle.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.h,
                      ),
                      child: Text(
                        'Silahkan mengisi semua informasi yang dibutuhkan untuk membuat akun baru',
                        style: GoogleTextStyle.fw600.copyWith(
                          fontSize: 16.sp,
                          color: ColorStyle.greyDark,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const FormSignUpComponent(),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(
            20.r,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      activeColor: ColorStyle.primary,
                      value: SignUpController.to.isConfirmationApproved.value,
                      onChanged: (value) {
                        SignUpController.to.isConfirmationApproved.value =
                            value!;
                      },
                      checkColor: ColorStyle.blackMedium,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Wrap(
                      children: [
                        Text(
                          'Setuju dengan '.tr,
                          style: GoogleTextStyle.fw400.copyWith(
                            fontSize: 12.sp,
                            color: ColorStyle.blackMedium,
                          ),
                        ),
                        Text(
                          'ketentuan penggunaan '.tr,
                          style: GoogleTextStyle.fw600.copyWith(
                            fontSize: 12.sp,
                            color: ColorStyle.primary,
                          ),
                        ),
                        Text(
                          'dan '.tr,
                          style: GoogleTextStyle.fw400.copyWith(
                            fontSize: 12.sp,
                            color: ColorStyle.blackMedium,
                          ),
                        ),
                        Text(
                          'kebijakan privasi'.tr,
                          style: GoogleTextStyle.fw600.copyWith(
                            fontSize: 12.sp,
                            color: ColorStyle.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ButtonSignupComponent(buttonText: 'Buat Akun'.tr),
            ],
          ),
        ),
      ),
    );
  }
}
