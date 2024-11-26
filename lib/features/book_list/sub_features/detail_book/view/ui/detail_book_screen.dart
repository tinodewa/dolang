import 'package:dolang/features/book_list/constants/book_list_assets_constant.dart';
import 'package:dolang/features/book_list/sub_features/detail_book/controllers/book_list_detail_book_controller.dart';
import 'package:dolang/features/book_list/sub_features/detail_book/view/components/bottom_navbar_detail_book.dart';
import 'package:dolang/features/booking/view/components/tile_confirmation_component.dart';
import 'package:dolang/features/home/view/components/item_card_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBookScreen extends StatelessWidget {
  DetailBookScreen({super.key});

  final assetsConstant = BookListAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Pemesanan',
          style: GoogleTextStyle.fw600.copyWith(
            fontSize: 22.sp,
            color: ColorStyle.blackMedium,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            20.r,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              SizedBox(height: 5.h),
              TileConfirmationComponent(
                title: 'Nama',
                message: BookListDetailBookController.to.book?.bookerName ?? '',
              ),
              SizedBox(height: 5.h),
              Divider(height: 0.5.h, color: ColorStyle.greyDark50),

              // Phone Number
              SizedBox(height: 5.h),
              TileConfirmationComponent(
                title: 'Nomor Telpon',
                message:
                    BookListDetailBookController.to.book?.bookerPhoneNumber ??
                        '',
              ),
              SizedBox(height: 5.h),
              Divider(height: 0.5.h, color: ColorStyle.greyDark50),

              // Date
              SizedBox(height: 5.h),
              TileConfirmationComponent(
                title: 'Tanggal',
                message:
                    BookListDetailBookController.to.book?.bookingDate ?? '',
              ),
              SizedBox(height: 5.h),
              Divider(height: 0.5.h, color: ColorStyle.greyDark50),

              // Time
              SizedBox(height: 5.h),
              TileConfirmationComponent(
                title: 'Waktu',
                message:
                    BookListDetailBookController.to.book?.bookingTime ?? '',
              ),
              SizedBox(height: 5.h),
              Divider(height: 0.5.h, color: ColorStyle.greyDark50),

              // Number of Person
              SizedBox(height: 5.h),
              TileConfirmationComponent(
                title: 'Jumlah Orang',
                message:
                    BookListDetailBookController.to.book?.numberOfPerson ?? '',
              ),
              SizedBox(height: 5.h),
              Divider(height: 0.5.h, color: ColorStyle.greyDark50),

              // Total Payment
              SizedBox(height: 5.h),
              TileConfirmationComponent(
                title: 'Total Harga',
                message:
                    BookListDetailBookController.to.book?.totalPayment ?? '',
              ),
              SizedBox(height: 30.h),
              BookListDetailBookController.to.destination != null
                  ? ItemCardComponent(
                      destination: BookListDetailBookController.to.destination!,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          BookListDetailBookController.to.book?.paymentStatus == '1'
              ? const BottomNavbarDetailBook()
              : const SizedBox.shrink(),
    );
  }
}
