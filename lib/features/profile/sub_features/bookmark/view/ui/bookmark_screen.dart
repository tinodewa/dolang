import 'package:dolang/features/home/constants/home_assets_constant.dart';
import 'package:dolang/features/profile/sub_features/bookmark/controllers/profile_bookmark_controller.dart';
import 'package:dolang/features/profile/sub_features/bookmark/view/components/bookmark_conditional_list.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  BookmarkScreen({super.key});

  final assetsConstant = HomeAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      body: RefreshIndicator(
        onRefresh: () => BookmarkController.to.getBookmarks(),
        child: const BookmarkConditionalList(),
      ),
    );
  }
}
