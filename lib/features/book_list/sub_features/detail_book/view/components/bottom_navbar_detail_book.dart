import 'package:dolang/features/book_list/sub_features/detail_book/controllers/book_list_detail_book_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavbarDetailBook extends StatelessWidget {
  const BottomNavbarDetailBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    BookListDetailBookController.to.confirmCancelBook(
                      context,
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: ColorStyle.primaryLight,
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(
                        color: ColorStyle.primaryLight,
                        width: 1.5,
                      ),
                    ),
                    shadowColor: ColorStyle.primary,
                    elevation: 3,
                  ),
                  child: Text(
                    'Batalkan'.tr,
                    style: GoogleTextStyle.fw700.copyWith(
                      fontSize: 14.0,
                      color: ColorStyle.blackMedium,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.h),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    BookListDetailBookController.to.confirmPaymentBook(
                      context,
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: ColorStyle.primaryLight,
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(
                        color: ColorStyle.primaryLight,
                        width: 1.5,
                      ),
                    ),
                    shadowColor: ColorStyle.primary,
                    elevation: 3,
                  ),
                  child: Text(
                    'Bayar Sekarang'.tr,
                    style: GoogleTextStyle.fw700.copyWith(
                      fontSize: 14.0,
                      color: ColorStyle.blackMedium,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
