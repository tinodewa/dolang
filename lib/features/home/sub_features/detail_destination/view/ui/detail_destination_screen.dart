import 'package:dolang/features/home/constants/home_assets_constant.dart';
import 'package:dolang/features/home/sub_features/detail_destination/controllers/home_detail_destination_controller.dart';
import 'package:dolang/features/home/sub_features/detail_destination/view/components/app_bar_detail_destination_component.dart';
import 'package:dolang/features/home/sub_features/detail_destination/view/components/bottom_navbar_detail_destination_component.dart';
import 'package:dolang/features/home/sub_features/detail_destination/view/components/description_destination_component.dart';
import 'package:dolang/features/home/sub_features/detail_destination/view/components/image_destination_component.dart';
import 'package:dolang/features/home/sub_features/detail_destination/view/components/main_info_destination_component.dart';
import 'package:dolang/features/home/sub_features/detail_destination/view/components/map_destination_component.dart';
import 'package:dolang/features/home/sub_features/detail_destination/view/components/sub_info_destination_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/widgets/error_screen.dart';
import 'package:dolang/utils/enums/data_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailDestinationScreen extends StatelessWidget {
  DetailDestinationScreen({super.key});

  final assetsConstant = HomeAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ConditionalSwitch.single(
        context: context,
        valueBuilder: (context) =>
            HomeDetailDestinationController.to.detailDestinationState.value,
        caseBuilders: {
          DataStatus.error: (context) => ErrorScreen(
                message: 'Terjadi kesalahan saat memuat detail destinasi!'.tr,
              ),
          DataStatus.success: (context) => Scaffold(
                extendBody: true,
                backgroundColor: ColorStyle.white,
                extendBodyBehindAppBar: true,
                appBar: const AppBarDetailDestinationComponent(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ImageDestinationComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20.r,
                          left: 20.r,
                          right: 20.r,
                          bottom: kBottomNavigationBarHeight + 20.r,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const MainInfoDestinationComponent(),
                            SizedBox(height: 8.h),
                            const SubInfoDestinationComponent(),
                            SizedBox(height: 15.h),
                            const DescriptionDestinationComponent(),
                            SizedBox(height: 12.h),
                            const MapDestinationComponent(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar:
                    const BottomNavbarDetailDestinationComponent(),
              ),
        },
      ),
    );
  }
}
