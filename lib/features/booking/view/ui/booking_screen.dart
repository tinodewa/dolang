import 'package:dolang/features/booking/constants/booking_assets_constant.dart';
import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/features/booking/view/components/appbar_booking_component.dart';
import 'package:dolang/features/booking/view/components/button_information_check_component.dart';
import 'package:dolang/features/booking/view/components/confirmation_bottom_component.dart';
import 'package:dolang/features/booking/view/ui/confirmation_booking_tab.dart';
import 'package:dolang/features/booking/view/ui/information_booking_tab.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final assetsConstant = BookingAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      // resizeToAvoidBottomInset: false,
      appBar: const AppbarBookingComponent(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: BookingController.to.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: BookingController.to.changePage,
            children: const [
              InformationBookingTab(),
              ConfirmationBookingTab(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BookingController.to.currentPageIndex.value == 0
            ? const ButtonInformationCheckComponent()
            : const ConfirmationBottomComponent(),
      ),
    );
  }
}
