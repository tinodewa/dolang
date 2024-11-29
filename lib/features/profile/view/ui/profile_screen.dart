import 'package:dolang/features/profile/constants/profile_assets_constant.dart';
import 'package:dolang/features/profile/view/components/account_settings_component.dart';
import 'package:dolang/features/profile/view/components/log_out_button_component.dart';
import 'package:dolang/features/profile/view/components/other_settings_component.dart';
import 'package:dolang/features/profile/view/components/profile_banner_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final assetsConstant = ProfileAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil'.tr,
          style: TextStyle(
            color: ColorStyle.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorStyle.complementary,
        elevation: 0,
      ),
      backgroundColor: ColorStyle.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const ProfileBannerComponent(),
          const AccountSettingsComponent(),
          const OtherSettingsComponent(),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
            ),
            child: const LogOutButtonComponent(),
          ),
        ],
      ),
    );
  }
}
