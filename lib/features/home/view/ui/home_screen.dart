import 'package:dolang/features/home/constants/home_assets_constant.dart';
import 'package:dolang/features/home/controllers/home_controller.dart';
import 'package:dolang/features/home/view/components/item_card_component.dart';
import 'package:dolang/features/home/view/components/search_app_bar_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final assetsConstant = HomeAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBarComponent(),
      backgroundColor: ColorStyle.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      HomeController.to.destinationList.isNotEmpty,
                  widgetBuilder: (context) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: HomeController.to.destinationList.length,
                    itemBuilder: (context, index) {
                      return ItemCardComponent(
                        destination: HomeController.to.destinationList[index],
                      );
                    },
                  ),
                  fallbackBuilder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              // ItemCardComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
