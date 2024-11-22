import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppbarBookingComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarBookingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
