import 'package:dolang/features/profile/sub_features/personal_information/controllers/profile_personal_information_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditButtonComponent extends StatelessWidget {
  const EditButtonComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: SizedBox(
        height: 45.h,
        width: 204.w,
        child: ElevatedButton(
          onPressed: () {
            ProfilePersonalInformationController.to
                .confirmEditPersonalInformation(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorStyle.primary,
            elevation: 3,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: ColorStyle.primaryDark,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                15.r,
              ),
            ),
          ),
          child: Text(
            "Edit".tr,
            style: GoogleTextStyle.fw800.copyWith(
              fontSize: 14.sp,
              color: ColorStyle.white,
            ),
          ),
        ),
      ),
    );
  }
}
