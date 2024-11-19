import 'package:dolang/features/profile/controllers/profile_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LogOutButtonComponent extends StatelessWidget {
  const LogOutButtonComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: 204.w,
      child: ElevatedButton(
        onPressed: ProfileController.to.logout,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorStyle.primary,
          elevation: 3,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: ColorStyle.primaryDark,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          "Log out".tr,
          style: GoogleTextStyle.fw800.copyWith(
            fontSize: 14.sp,
            color: ColorStyle.white,
          ),
        ),
      ),
    );
  }
}
