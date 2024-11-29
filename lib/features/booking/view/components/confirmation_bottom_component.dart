import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/features/booking/view/components/dashed_separator_component.dart';
import 'package:dolang/shared/widgets/tile_option_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ConfirmationBottomComponent extends StatelessWidget {
  const ConfirmationBottomComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DashedSeparatorComponent(
            color: ColorStyle.greyDark50,
          ),
          // Harga per orang
          SizedBox(height: 20.h),
          TileOptionComponent(
            title: 'Harga'.tr,
            message:
                'Rp ${BookingController.to.destination?.pricePerPerson}/${'orang'.tr}',
            titleStyle: GoogleTextStyle.fw400.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.blackMedium,
            ),
            messageStyle: GoogleTextStyle.fw500.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          // Harga Total
          SizedBox(height: 5.h),
          TileOptionComponent(
            title: 'Total',
            message: 'Rp ${BookingController.to.totalPayment.value.toString()}',
            titleStyle: GoogleTextStyle.fw500.copyWith(
              fontSize: 17.sp,
              color: ColorStyle.blackMedium,
            ),
            messageStyle: GoogleTextStyle.fw700.copyWith(
              fontSize: 18.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    BookingController.to.changePage(0);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: ColorStyle.primaryLight,
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(
                        color: ColorStyle.primaryLight,
                        width: 1.5,
                      ),
                    ),
                    shadowColor: ColorStyle.primary,
                    elevation: 3,
                  ),
                  child: Text(
                    'Rubah Data'.tr,
                    style: GoogleTextStyle.fw700.copyWith(
                      fontSize: 14.0,
                      color: ColorStyle.blackMedium,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.h),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    try {
                      BookingController.to.confirmBooking(context);
                    } catch (exception, stackTrace) {
                      Sentry.captureException(
                        exception,
                        stackTrace: stackTrace,
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: ColorStyle.primaryLight,
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(
                        color: ColorStyle.primaryLight,
                        width: 1.5,
                      ),
                    ),
                    shadowColor: ColorStyle.primary,
                    elevation: 3,
                  ),
                  child: Text(
                    'Buat Pesanan'.tr,
                    style: GoogleTextStyle.fw700.copyWith(
                      fontSize: 14.0,
                      color: ColorStyle.blackMedium,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
