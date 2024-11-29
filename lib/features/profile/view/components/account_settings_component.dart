import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/features/profile/controllers/profile_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:dolang/shared/widgets/tile_option_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountSettingsComponent extends StatelessWidget {
  const AccountSettingsComponent({
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
              'Pengaturan Akun'.tr,
              style: GoogleTextStyle.fw500.copyWith(
                fontSize: 18.sp,
                color: ColorStyle.greyDark,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          TileOptionComponent(
            onTap: () {
              Get.toNamed(
                Routes.profilePersonalInformationRoute,
                arguments: ProfileController.to.userModel.value,
              );
            },
            title: 'Informasi Pribadi'.tr,
            message: '',
            titleStyle: GoogleTextStyle.fw600.copyWith(
              fontSize: 14.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          TileOptionComponent(
            onTap: () {
              Get.toNamed(Routes.bookmarkRoute);
            },
            title: 'Bookmark'.tr,
            message: '',
            titleStyle: GoogleTextStyle.fw600.copyWith(
              fontSize: 14.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          TileOptionComponent(
            onTap: () {
              ProfileController.to.updateLanguage();
            },
            title: 'Change Language'.tr,
            message: '',
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
