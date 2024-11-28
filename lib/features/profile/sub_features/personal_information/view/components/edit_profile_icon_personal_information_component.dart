import 'package:cached_network_image/cached_network_image.dart';
import 'package:dolang/constants/core/assets/image_constant.dart';
import 'package:dolang/features/profile/sub_features/personal_information/controllers/profile_personal_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileIconPersonalInformationComponent extends StatelessWidget {
  const EditProfileIconPersonalInformationComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 140.w,
        height: 140.h,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Stack(
          children: [
            Image.asset(
              ImageConstant.user,
              height: 140.h,
              width: 140.w,
            ),
            Obx(
              () => Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    ProfilePersonalInformationController.to.imageFile != null,
                widgetBuilder: (context) => Image.file(
                  ProfilePersonalInformationController.to.imageFile!,
                  width: 140.r,
                  height: 140.r,
                  fit: BoxFit.cover,
                ),
                fallbackBuilder: (context) => Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      ProfilePersonalInformationController
                          .to.userModel.value?.photoUrl !=
                      '',
                  widgetBuilder: (context) => CachedNetworkImage(
                    imageUrl: ProfilePersonalInformationController
                            .to.userModel.value?.photoUrl ??
                        '',
                    fit: BoxFit.cover,
                    height: 140.h,
                    width: 140.w,
                    errorWidget: (context, _, __) => Image.asset(
                      ImageConstant.user,
                      height: 140.h,
                      width: 140.w,
                    ),
                  ),
                  fallbackBuilder: (context) => Image.asset(
                    ImageConstant.user,
                    height: 140.h,
                    width: 140.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
