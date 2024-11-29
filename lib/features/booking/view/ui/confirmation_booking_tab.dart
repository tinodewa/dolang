import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/features/booking/view/components/tile_confirmation_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConfirmationBookingTab extends StatelessWidget {
  const ConfirmationBookingTab({
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
              'Konfirmasi Pemesanan'.tr,
              style: GoogleTextStyle.fw600.copyWith(
                fontSize: 22.sp,
                color: ColorStyle.blackMedium,
              ),
            ),
            SizedBox(height: 30.h),

            // Name
            SizedBox(height: 5.h),
            TileConfirmationComponent(
              title: 'Nama'.tr,
              message: BookingController.to.fullNameValue.value,
            ),
            SizedBox(height: 5.h),
            Divider(height: 0.5.h, color: ColorStyle.greyDark50),

            // Phone Number
            SizedBox(height: 5.h),
            TileConfirmationComponent(
              title: 'Nomor Telpon'.tr,
              message: BookingController.to.phoneNumberValue.value,
            ),
            SizedBox(height: 5.h),
            Divider(height: 0.5.h, color: ColorStyle.greyDark50),

            // Date
            SizedBox(height: 5.h),
            TileConfirmationComponent(
              title: 'Tanggal'.tr,
              message: BookingController.to.date.value,
            ),
            SizedBox(height: 5.h),
            Divider(height: 0.5.h, color: ColorStyle.greyDark50),

            // Time
            SizedBox(height: 5.h),
            TileConfirmationComponent(
              title: 'Waktu'.tr,
              message: BookingController.to.time.value.format(context),
            ),
            SizedBox(height: 5.h),
            Divider(height: 0.5.h, color: ColorStyle.greyDark50),

            // Number of Person
            SizedBox(height: 5.h),
            TileConfirmationComponent(
              title: 'Jumlah Orang'.tr,
              message: BookingController.to.personTotalValue.value,
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
