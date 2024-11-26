import 'package:cached_network_image/cached_network_image.dart';
import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/features/book_list/models/book_model.dart';
import 'package:dolang/features/book_list/models/detail_book_arguments.dart';
import 'package:dolang/features/book_list/view/components/book_status_chip_component.dart';
import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookCardComponent extends StatelessWidget {
  const BookCardComponent({
    super.key,
    required this.book,
    required this.destination,
  });

  final BookModel book;
  final DestinationModel destination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.bookListDetailBookRoute,
          arguments: DetailBookArguments(
            book,
            destination,
          ),
        );
      },
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        width: 1.sw,
        height: 90.h,
        decoration: BoxDecoration(
          color: ColorStyle.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: const [
            BoxShadow(
              color: ColorStyle.greyDark50,
              offset: Offset(0, 1),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    destination.photo ??
                        'https://javacode.landa.id/img/promo/gambar_62661b52223ff.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          destination.name ?? '',
                          style: GoogleTextStyle.fw600.copyWith(
                            fontSize: 14.sp,
                            color: ColorStyle.blackMedium,
                          ),
                        ),
                        Text(
                          int.parse(book.totalPayment.toString()) != 0
                              ? 'Rp ${book.totalPayment}'
                              : 'Gratis',
                          style: GoogleTextStyle.fw500.copyWith(
                            fontSize: 13.sp,
                            color: ColorStyle.blackMedium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: ColorStyle.blackMedium,
                          size: 12.r,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          book.bookingDate ?? '',
                          style: GoogleTextStyle.fw400.copyWith(
                            fontSize: 12.sp,
                            color: ColorStyle.blackMedium,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.schedule,
                          color: ColorStyle.blackMedium,
                          size: 12.r,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          book.bookingTime ?? '',
                          style: GoogleTextStyle.fw400.copyWith(
                            fontSize: 12.sp,
                            color: ColorStyle.blackMedium,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.people_outline,
                          color: ColorStyle.blackMedium,
                          size: 12.r,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          book.numberOfPerson ?? '',
                          style: GoogleTextStyle.fw400.copyWith(
                            fontSize: 12.sp,
                            color: ColorStyle.blackMedium,
                          ),
                        ),
                      ],
                    ),
                    BookStatusChipComponent(book: book)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
