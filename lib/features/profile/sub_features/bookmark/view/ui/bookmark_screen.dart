import 'package:dolang/features/home/constants/home_assets_constant.dart';
import 'package:dolang/features/profile/sub_features/bookmark/controllers/profile_bookmark_controller.dart';
import 'package:dolang/features/profile/sub_features/bookmark/view/components/bookmark_conditional_list.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookmarkScreen extends StatelessWidget {
  BookmarkScreen({super.key});

  final assetsConstant = HomeAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmark'.tr,
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
      backgroundColor: ColorStyle.white,
      body: RefreshIndicator(
        onRefresh: () => BookmarkController.to.getBookmarks(),
        child: const BookmarkConditionalList(),
      ),
    );
  }
}
