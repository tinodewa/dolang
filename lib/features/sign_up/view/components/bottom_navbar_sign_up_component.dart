import 'package:dolang/features/sign_up/controllers/sign_up_controller.dart';
import 'package:dolang/features/sign_up/view/components/button_sign_up_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavbarSignUpComponent extends StatelessWidget {
  const BottomNavbarSignUpComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    SignUpController.to.isConfirmationApproved.value = value!;
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
    );
  }
}
