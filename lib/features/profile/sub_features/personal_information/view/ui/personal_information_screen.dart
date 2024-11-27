import 'package:dolang/features/profile/constants/profile_assets_constant.dart';
import 'package:dolang/features/profile/sub_features/personal_information/view/components/edit_button_component.dart';
import 'package:dolang/features/profile/sub_features/personal_information/view/components/form_edit_personal_information_component.dart';
import 'package:dolang/features/profile/sub_features/personal_information/view/components/personal_information_banner_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  final assetsConstant = ProfileAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Information',
          style: TextStyle(
            color: ColorStyle.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorStyle.complementary,
        elevation: 0,
        foregroundColor: ColorStyle.white,
      ),
      backgroundColor: ColorStyle.white,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          PersonalInformationBannerComponent(),
          FormEditPersonalInformationComponent(),
        ],
      ),
      bottomNavigationBar: const EditButtonComponent(),
    );
  }
}
