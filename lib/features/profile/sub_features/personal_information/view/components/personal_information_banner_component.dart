import 'package:dolang/features/profile/sub_features/personal_information/controllers/profile_personal_information_controller.dart';
import 'package:dolang/features/profile/view/components/profile_icon_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInformationBannerComponent extends StatelessWidget {
  const PersonalInformationBannerComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyle.complementary,
      child: Column(
        children: [
          SizedBox(height: 20.h),
          const ProfileIconComponent(),
          SizedBox(height: 25.h),
          GestureDetector(
            onTap: () {
              ProfilePersonalInformationController.to.pickImage();
            },
            child: Text(
              'Ganti Foto Profil',
              style: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 40.h),
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
