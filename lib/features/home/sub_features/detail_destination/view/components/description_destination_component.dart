import 'package:dolang/features/home/sub_features/detail_destination/controllers/home_detail_destination_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DescriptionDestinationComponent extends StatelessWidget {
  const DescriptionDestinationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deskripsi'.tr,
          style: GoogleTextStyle.fw600.copyWith(
            fontSize: 20.sp,
            color: ColorStyle.blackMedium,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          HomeDetailDestinationController.to.destination?.description ??
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          style: GoogleTextStyle.fw400.copyWith(
            fontSize: 14.sp,
            color: ColorStyle.blackMedium,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
