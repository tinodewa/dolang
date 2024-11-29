import 'package:dolang/features/book_list/constants/book_list_assets_constant.dart';
import 'package:dolang/features/book_list/controllers/book_list_controller.dart';
import 'package:dolang/features/book_list/view/components/book_card_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/widgets/error_screen.dart';
import 'package:dolang/utils/enums/data_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookListScreen extends StatelessWidget {
  BookListScreen({super.key});

  final assetsConstant = BookListAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Pemesanan'.tr,
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
        onRefresh: () => BookListController.to.getBooks(),
        child: Obx(
          () => ConditionalSwitch.single(
            context: context,
            valueBuilder: (context) => BookListController.to.booksState.value,
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
                          message: 'Terjadi kesalahan saat memuat pesanan!'.tr,
                        ),
                      ),
                    ),
                  ),
              DataStatus.success: (context) => ListView.separated(
                    padding: EdgeInsets.all(20.r),
                    itemBuilder: (context, index) {
                      return BookCardComponent(
                        book: BookListController.to.bookList[index],
                        destination:
                            BookListController.to.finalDestinationList[index],
                      );
                    },
                    separatorBuilder: (context, index) => 16.verticalSpace,
                    itemCount: BookListController.to.bookList.length,
                  ),
            },
          ),
        ),
      ),
    );
  }
}
