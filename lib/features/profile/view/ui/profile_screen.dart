import 'package:dolang/features/booking/view/components/label_form_field_component.dart';
import 'package:dolang/features/booking/view/components/tile_confirmation_component.dart';
import 'package:dolang/features/profile/constants/profile_assets_constant.dart';
import 'package:dolang/features/profile/controllers/profile_controller.dart';
import 'package:dolang/features/profile/sub_features/bookmark/view/components/bookmark_conditional_list.dart';
import 'package:dolang/features/profile/view/components/log_out_button_component.dart';
import 'package:dolang/features/profile/view/components/profile_icon_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final assetsConstant = ProfileAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: ColorStyle.blackMedium,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorStyle.white,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const ProfileIconComponent(),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TileConfirmationComponent(
                      title: 'Nama',
                      message:
                          ProfileController.to.userModel.value?.username ?? '',
                    ),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TileConfirmationComponent(
                      title: 'Email',
                      message:
                          ProfileController.to.userModel.value?.email ?? '',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    bottom: 5.h,
                  ),
                  child: const LabelFormFieldComponent(
                    title: 'Bookmark',
                  ),
                ),
                const BookmarkConditionalList(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                  ),
                  child: const LogOutButtonComponent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
