import 'package:dolang/features/profile/controllers/profile_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:dolang/shared/widgets/tile_option_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtherSettingsComponent extends StatelessWidget {
  const OtherSettingsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 5.h,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Lainnya'.tr,
              style: GoogleTextStyle.fw500.copyWith(
                fontSize: 18.sp,
                color: ColorStyle.greyDark,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          TileOptionComponent(
            onTap: () {
              ProfileController.to.privacyPolicyWebView();
            },
            title: 'Privasi & Kebijakan'.tr,
            message: '',
            titleStyle: GoogleTextStyle.fw600.copyWith(
              fontSize: 14.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          TileOptionComponent(
            title: 'Informasi Perangkat'.tr,
            message: ProfileController.to.deviceModel.value,
            titleStyle: GoogleTextStyle.fw600.copyWith(
              fontSize: 14.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          TileOptionComponent(
            title: 'Versi Perangkat'.tr,
            message: ProfileController.to.deviceVersion.value,
            titleStyle: GoogleTextStyle.fw600.copyWith(
              fontSize: 14.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
        ],
      ),
    );
  }
}
