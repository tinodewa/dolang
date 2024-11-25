import 'package:dolang/features/book_list/models/book_model.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookStatusChipComponent extends StatelessWidget {
  const BookStatusChipComponent({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    Color color;
    String status;

    if (book.paymentStatus == '1') {
      color = ColorStyle.primary;
      status = 'Pending';
    } else if (book.paymentStatus == '2') {
      color = ColorStyle.complementary;
      status = 'Success';
    } else {
      color = ColorStyle.red;
      status = 'Failed';
    }

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.5.h),
        child: Text(
          status,
          style: GoogleTextStyle.fw600.copyWith(
            fontSize: 12.sp,
            color: ColorStyle.blackMedium,
          ),
        ),
      ),
    );
  }
}
