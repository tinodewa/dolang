import 'package:dolang/features/booking/view/components/form_information_booking_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InformationBookingTab extends StatelessWidget {
  const InformationBookingTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(
          20.r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Informasi'.tr,
              style: GoogleTextStyle.fw600.copyWith(
                fontSize: 22.sp,
                color: ColorStyle.blackMedium,
              ),
            ),
            SizedBox(height: 30.h),
            const FormInformationBookingComponent(),
          ],
        ),
      ),
    );
  }
}
