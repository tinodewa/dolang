import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/features/booking/view/components/tile_option_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              'Konfirmasi Pemesanan',
              style: GoogleTextStyle.fw600.copyWith(
                fontSize: 22.sp,
                color: ColorStyle.blackMedium,
              ),
            ),
            SizedBox(height: 30.h),

            // Name
            SizedBox(height: 5.h),
            TileOptionComponent(
              title: 'Nama',
              message: BookingController.to.fullNameValue.value,
              titleStyle: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.blackMedium,
              ),
              messageStyle: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.blackMedium,
              ),
            ),
            SizedBox(height: 5.h),
            Divider(height: 0.5.h, color: ColorStyle.greyDark50),

            // Phone Number
            SizedBox(height: 5.h),
            TileOptionComponent(
              title: 'Nomor Telpon',
              message: BookingController.to.phoneNumberValue.value,
              titleStyle: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.blackMedium,
              ),
              messageStyle: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.blackMedium,
              ),
            ),
            SizedBox(height: 5.h),
            Divider(height: 0.5.h, color: ColorStyle.greyDark50),

            // Date
            SizedBox(height: 5.h),
            TileOptionComponent(
              title: 'Tanggal',
              message: BookingController.to.date.value,
              titleStyle: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.blackMedium,
              ),
              messageStyle: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.blackMedium,
              ),
            ),
            SizedBox(height: 5.h),
            Divider(height: 0.5.h, color: ColorStyle.greyDark50),

            // Time
            SizedBox(height: 5.h),
            TileOptionComponent(
              title: 'Waktu',
              message: BookingController.to.time.value.format(context),
              titleStyle: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.blackMedium,
              ),
              messageStyle: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.blackMedium,
              ),
            ),
            SizedBox(height: 5.h),
            Divider(height: 0.5.h, color: ColorStyle.greyDark50),

            // Number of Person
            SizedBox(height: 5.h),
            TileOptionComponent(
              title: 'Jumlah Orang',
              message: BookingController.to.personTotalValue.value,
              titleStyle: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.blackMedium,
              ),
              messageStyle: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.blackMedium,
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
