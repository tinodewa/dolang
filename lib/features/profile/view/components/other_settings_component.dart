import 'package:dolang/features/profile/controllers/profile_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:dolang/shared/widgets/tile_option_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              'Other',
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
            title: 'Privacy & Policy',
            message: '',
            titleStyle: GoogleTextStyle.fw600.copyWith(
              fontSize: 14.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          TileOptionComponent(
            title: 'Device Information',
            message: ProfileController.to.deviceModel.value,
            titleStyle: GoogleTextStyle.fw600.copyWith(
              fontSize: 14.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          TileOptionComponent(
            title: 'Device Version',
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
