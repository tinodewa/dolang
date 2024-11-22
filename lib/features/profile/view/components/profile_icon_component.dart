import 'package:dolang/constants/core/assets/image_constant.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileIconComponent extends StatelessWidget {
  const ProfileIconComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170.r,
        height: 170.r,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Stack(
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                ColorStyle.primary,
                BlendMode.modulate,
              ),
              child: Image.asset(
                ImageConstant.iconsProfilePlaceholder,
                height: 170.h,
                width: 170.w,
              ),
            ),
            // Obx(
            //   () => Conditional.single(
            //     context: context,
            //     conditionBuilder: (context) =>
            //         ProfileController.to.?.value != '',
            //     widgetBuilder: (context) => CachedNetworkImage(
            //       imageUrl: ProfileController.to.photo!.value,
            //       fit: BoxFit.cover,
            //       width: 170.r,
            //       height: 170.r,
            //       errorWidget: (context, _, __) =>
            //           const EmptyProfilePhotoPlaceholderComponent(),
            //     ),
            //     fallbackBuilder: (context) => Conditional.single(
            //       context: context,
            //       conditionBuilder: (context) =>
            //           ProfileController.to.imageFile != null,
            //       widgetBuilder: (context) => Image.file(
            //         ProfileController.to.imageFile!,
            //         width: 170.r,
            //         height: 170.r,
            //         fit: BoxFit.cover,
            //       ),
            //       fallbackBuilder: (context) =>
            //           const EmptyProfilePhotoPlaceholderComponent(),
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: ColorStyle.complementary,
                child: InkWell(
                  // onTap: ProfileController.to.pickImage,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 10.r,
                      bottom: 15.r,
                    ),
                    child: Text(
                      "Change".tr,
                      style: Get.textTheme.labelMedium!
                          .copyWith(color: ColorStyle.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
