import 'package:dolang/features/home/constants/home_assets_constant.dart';
import 'package:dolang/features/home/controllers/home_controller.dart';
import 'package:dolang/features/home/view/components/item_card_component.dart';
import 'package:dolang/features/home/view/components/home_app_bar_component.dart';
import 'package:dolang/shared/widgets/error_screen.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/utils/enums/data_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final assetsConstant = HomeAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBarComponent(),
      backgroundColor: ColorStyle.white,
      body: RefreshIndicator(
        onRefresh: () => HomeController.to.getDestination(),
        child: Obx(
          () => ConditionalSwitch.single(
            context: context,
            valueBuilder: (context) => HomeController.to.destinationState.value,
            caseBuilders: {
              DataStatus.loading: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorStyle.blackMedium,
                    ),
                  ),
              DataStatus.error: (context) => Center(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: 0.7.sh,
                        child: ErrorScreen(
                          message:
                              'Terjadi kesalahan saat memuat destinasi!'.tr,
                        ),
                      ),
                    ),
                  ),
              DataStatus.success: (context) => ListView.separated(
                    padding: EdgeInsets.all(10.r),
                    itemBuilder: (context, index) {
                      return ItemCardComponent(
                        destination: HomeController.to.destinationList[index],
                      );
                    },
                    separatorBuilder: (context, index) => 16.verticalSpace,
                    itemCount: HomeController.to.destinationList.length,
                  ),
            },
          ),
        ),
      ),
    );
  }
}
