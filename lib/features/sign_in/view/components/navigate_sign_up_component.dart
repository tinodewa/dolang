import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NavigateSignUpComponent extends StatelessWidget {
  const NavigateSignUpComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Get.toNamed(Routes.signUpRoute);
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
    );
  }
}
