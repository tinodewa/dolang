import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CylinderInformationComponent extends StatelessWidget {
  const CylinderInformationComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: ColorStyle.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.r),
          top: Radius.circular(30.r),
        ),
        border: Border.all(
          color: ColorStyle.greyDark50,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 1.sw * 0.41,
            height: 40.h,
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 2.h,
            ),
            decoration: BoxDecoration(
              color: ColorStyle.greyLight,
              borderRadius: BorderRadius.circular(
                30.r,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people,
                  color: ColorStyle.complementary,
                  size: 22.r,
                ),
                SizedBox(width: 6.h),
                Text(
                  'Max 12 Grup Size',
                  style: GoogleTextStyle.fw500.copyWith(
                    fontSize: 12.sp,
                    color: ColorStyle.blackMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 1.5.w,
            child: Container(
              height: 25.h,
              color: ColorStyle.greyDark50,
            ),
          ),
          Container(
            width: 1.sw * 0.41,
            height: 40.h,
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 2.h,
            ),
            decoration: BoxDecoration(
              color: ColorStyle.greyLight,
              borderRadius: BorderRadius.circular(
                30.r,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timelapse_rounded,
                  color: ColorStyle.complementary,
                  size: 22.r,
                ),
                SizedBox(width: 6.h),
                Text(
                  '4 Day Trip Duration',
                  style: GoogleTextStyle.fw500.copyWith(
                    fontSize: 12.sp,
                    color: ColorStyle.blackMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
