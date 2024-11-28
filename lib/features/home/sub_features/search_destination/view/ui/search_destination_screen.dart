import 'package:dolang/features/home/constants/home_assets_constant.dart';
import 'package:dolang/features/home/controllers/home_controller.dart';
import 'package:dolang/features/home/sub_features/search_destination/controllers/home_search_destination_controller.dart';
import 'package:dolang/features/home/sub_features/search_destination/view/components/search_app_bar_input_component.dart';
import 'package:dolang/features/home/view/components/item_card_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/widgets/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchDestinationScreen extends StatelessWidget {
  SearchDestinationScreen({
    super.key,
    this.searchController,
    this.onChange,
  });

  final TextEditingController? searchController;
  final ValueChanged<String>? onChange;

  final assetsConstant = HomeAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SearchAppBarInputComponent(
            searchController: searchController,
            onChange: (value) {
              HomeSearchDestinationController.to.keyword(value);
            },
          ),
          centerTitle: true,
          backgroundColor: ColorStyle.white,
          elevation: 0,
        ),
        backgroundColor: ColorStyle.white,
        body: Obx(
          () => Conditional.single(
            context: context,
            conditionBuilder: (context) => HomeSearchDestinationController
                .to.filteredDestinationList.isNotEmpty,
            widgetBuilder: (context) => SmartRefresher(
              controller: HomeSearchDestinationController
                  .to.refreshDestinationController,
              enablePullDown: false,
              enablePullUp: HomeSearchDestinationController
                      .to.canLoadMoreDestination.isTrue
                  ? true
                  : false,
              onLoading:
                  HomeSearchDestinationController.to.getListOfDataDestination,
              child: ListView.separated(
                padding: EdgeInsets.all(10.r),
                itemBuilder: (context, index) {
                  return ItemCardComponent(
                    destination: HomeSearchDestinationController
                        .to.filteredDestinationList[index],
                  );
                },
                separatorBuilder: (context, index) => 16.verticalSpace,
                itemCount: HomeSearchDestinationController
                    .to.filteredDestinationList.length,
              ),
            ),
            fallbackBuilder: (context) => const ErrorScreen(
              message: 'Destinasi tidak ada!',
            ),
          ),
        ),
      ),
    );
  }
}
