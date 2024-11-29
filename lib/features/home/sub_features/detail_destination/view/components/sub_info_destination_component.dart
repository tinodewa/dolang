import 'package:dolang/features/home/sub_features/detail_destination/controllers/home_detail_destination_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubInfoDestinationComponent extends StatelessWidget {
  const SubInfoDestinationComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 17.r,
          color: ColorStyle.greyMedium,
        ),
        Text(
          HomeDetailDestinationController.to.destination?.location ?? '',
          style: GoogleTextStyle.fw400.copyWith(
            fontSize: 14.sp,
            color: ColorStyle.greyDark,
          ),
        ),
        SizedBox(width: 7.w),
        Text(
          '|',
          style: GoogleTextStyle.fw400.copyWith(
            fontSize: 14.sp,
            color: ColorStyle.greyMedium,
          ),
        ),
        SizedBox(width: 7.w),
        Icon(
          Icons.my_location_sharp,
          size: 17.r,
          color: ColorStyle.greyDark,
        ),
        SizedBox(width: 2.w),
        Text(
          HomeDetailDestinationController.to.destination?.distance ?? '',
          style: GoogleTextStyle.fw400.copyWith(
            fontSize: 14.sp,
            color: ColorStyle.greyDark,
          ),
        ),
      ],
    );
  }
}
