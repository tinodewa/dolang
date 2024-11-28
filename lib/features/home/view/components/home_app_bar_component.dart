import 'package:dolang/features/home/controllers/home_controller.dart';
import 'package:dolang/features/home/view/components/home_app_bar_input_component.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:dolang/utils/enums/data_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeAppBarComponent({
    super.key,
    this.searchController,
    this.onChange,
  });

  final TextEditingController? searchController;
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.r,
        vertical: 6.r,
      ),
      child: Container(
        width: double.infinity,
        height: 68.h,
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Obx(
                () => Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      HomeController.to.destinationState.value !=
                      DataStatus.loading,
                  widgetBuilder: (context) => Container(
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
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorStyle.complementary,
                          size: 20.r,
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Text(
                            GlobalController.to.addressShort.value.toString(),
                            style: GoogleTextStyle.fw400.copyWith(
                              fontSize: 11.sp,
                              color: ColorStyle.blackMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  fallbackBuilder: (context) => Container(
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
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorStyle.complementary,
                          size: 20.r,
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Text(
                            'Loading...',
                            style: GoogleTextStyle.fw400.copyWith(
                              fontSize: 11.sp,
                              color: ColorStyle.blackMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Center(
                child: Text('|'),
              ),
            ),
            Expanded(
              flex: 3,
              child: HomeAppBarInputComponent(
                searchController: searchController,
                onChange: onChange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
