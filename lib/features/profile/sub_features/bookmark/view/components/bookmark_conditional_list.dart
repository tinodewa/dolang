import 'package:dolang/features/home/view/components/item_card_component.dart';
import 'package:dolang/features/profile/sub_features/bookmark/controllers/profile_bookmark_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/widgets/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class BookmarkConditionalList extends StatelessWidget {
  const BookmarkConditionalList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ConditionalSwitch.single(
        context: context,
        valueBuilder: (context) =>
            BookmarkController.to.bookmarkDestinationState.value,
        caseBuilders: {
          'loading': (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorStyle.blackMedium,
                ),
              ),
          'error': (context) => const ErrorScreen(
                message: 'Error loading bookmark!',
              ),
          'success': (context) => ListView.separated(
                padding: EdgeInsets.all(10.r),
                itemBuilder: (context, index) {
                  return ItemCardComponent(
                    destination: BookmarkController.to.destinationList[index],
                  );
                },
                separatorBuilder: (context, index) => 16.verticalSpace,
                itemCount: BookmarkController.to.bookmarkList.length,
                shrinkWrap: true,
              ),
        },
      ),
    );
  }
}
