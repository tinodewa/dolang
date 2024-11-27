import 'package:dolang/features/profile/controllers/profile_controller.dart';
import 'package:dolang/features/profile/view/components/profile_icon_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileBannerComponent extends StatelessWidget {
  const ProfileBannerComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyle.complementary,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Row(
              children: [
                const ProfileIconComponent(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          ProfileController.to.userModel.value?.username ?? '',
                          style: GoogleTextStyle.fw600.copyWith(
                            fontSize: 16.sp,
                            color: ColorStyle.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Obx(
                      () => SizedBox(
                        width: 0.7.sw,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            ProfileController.to.userModel.value?.email ?? '',
                            style: GoogleTextStyle.fw600.copyWith(
                              fontSize: 13.sp,
                              color: ColorStyle.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 1.sw,
            height: 20.h,
            decoration: BoxDecoration(
              color: ColorStyle.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.r),
              ),
              border: Border.all(
                color: ColorStyle.white,
                width: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
