import 'package:dolang/features/booking/constants/booking_assets_constant.dart';
import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/features/booking/view/components/dashed_separator.dart';
import 'package:dolang/features/booking/view/components/tile_option_component.dart';
import 'package:dolang/features/booking/view/ui/confirmation_booking_tab.dart';
import 'package:dolang/features/booking/view/ui/information_booking_tab.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final assetsConstant = BookingAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorStyle.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(13.r),
          child: CircleAvatar(
            radius: 30.r,
            backgroundColor: ColorStyle.secondary,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: ColorStyle.blackDark,
                size: 21.sp,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        title: Container(
          height: 10.h,
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
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorStyle.complementary,
                      borderRadius: BorderRadius.circular(
                        30.r,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: BookingController.to.currentPageIndex.value == 1
                          ? ColorStyle.complementary
                          : ColorStyle.greyDark50,
                      borderRadius: BorderRadius.circular(
                        30.r,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: BookingController.to.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: BookingController.to.changePage,
            children: const [
              InformationBookingTab(),
              ConfirmationBookingTab(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BookingController.to.currentPageIndex.value == 0
            ? Container(
                width: double.infinity,
                height: kBottomNavigationBarHeight,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.r,
                    right: 20.r,
                    bottom: 20.r,
                  ),
                  child: TextButton(
                    onPressed: () {
                      try {
                        BookingController.to
                            .validateFormInformationBooking(context);
                      } catch (exception, stackTrace) {
                        Sentry.captureException(
                          exception,
                          stackTrace: stackTrace,
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: ColorStyle.primaryLight,
                      minimumSize: const Size(double.infinity, 50),
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
                      'Selanjutnya',
                      style: GoogleTextStyle.fw700.copyWith(
                        fontSize: 14.0,
                        color: ColorStyle.blackMedium,
                      ),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DashedSeparator(
                      color: ColorStyle.greyDark50,
                    ),
                    // Harga per orang
                    SizedBox(height: 20.h),
                    TileOptionComponent(
                      title: 'Harga',
                      message:
                          'Rp ${BookingController.to.destination?.pricePerPerson}/orang',
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
                      message:
                          BookingController.to.totalPayment.value.toString(),
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
                              'Rubah Data',
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
                              'Buat Pesanan',
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
              ),
      ),
    );
  }
}
