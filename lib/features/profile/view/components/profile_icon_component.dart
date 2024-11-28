import 'package:cached_network_image/cached_network_image.dart';
import 'package:dolang/constants/core/assets/image_constant.dart';
import 'package:dolang/features/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
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
        width: 80.w,
        height: 80.h,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Stack(
          children: [
            Image.asset(
              ImageConstant.user,
              height: 80.h,
              width: 80.w,
            ),
            Obx(
              () => Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    ProfileController.to.userModel.value?.photoUrl != '',
                widgetBuilder: (context) => CachedNetworkImage(
                  imageUrl:
                      ProfileController.to.userModel.value?.photoUrl ?? '',
                  fit: BoxFit.cover,
                  height: 80.h,
                  width: 80.w,
                  errorWidget: (context, _, __) => Image.asset(
                    ImageConstant.user,
                    height: 80.h,
                    width: 80.w,
                  ),
                ),
                fallbackBuilder: (context) => Image.asset(
                  ImageConstant.user,
                  height: 80.h,
                  width: 80.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
