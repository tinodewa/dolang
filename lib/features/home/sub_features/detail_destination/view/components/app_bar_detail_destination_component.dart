import 'package:dolang/features/home/sub_features/detail_destination/controllers/home_detail_destination_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarDetailDestinationComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarDetailDestinationComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.all(13.r),
        child: CircleAvatar(
          radius: 30.r,
          backgroundColor: ColorStyle.secondary,
          child: Padding(
            padding: EdgeInsets.only(left: 4.r),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorStyle.blackDark,
                size: 20.sp,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
      ),
      actions: [
        SizedBox(
          width: 45.w,
          height: 45.h,
          child: CircleAvatar(
            radius: 30.r,
            backgroundColor: ColorStyle.secondary,
            child: Obx(
              () => IconButton(
                icon: Icon(
                  HomeDetailDestinationController.to.isBookmark.value
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: ColorStyle.blackDark,
                  size: 21.sp,
                ),
                onPressed: () {
                  HomeDetailDestinationController.to.isBookmark.value
                      ? HomeDetailDestinationController.to.removeBookmark()
                      : HomeDetailDestinationController.to.addBookmark();
                },
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
