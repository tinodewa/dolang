import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchAppBarInputComponent extends StatelessWidget {
  const SearchAppBarInputComponent({
    super.key,
    required this.searchController,
    required this.onChange,
  });

  final TextEditingController? searchController;
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      style: GoogleTextStyle.fw500.copyWith(
        color: ColorStyle.blackMedium,
        fontSize: 14.sp,
      ),
      cursorColor: ColorStyle.primary,
      maxLines: 1,
      onChanged: onChange,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(
          top: 10.h,
        ),
        isDense: true,
        suffixIcon: Icon(
          Icons.search,
          size: 26.h,
        ),
        suffixIconColor: ColorStyle.primary,
        hintText: 'Cari destinasi...'.tr,
        hintStyle: GoogleTextStyle.fw400.copyWith(
          color: ColorStyle.greyDark,
          fontSize: 12.sp,
          letterSpacing: 0,
        ),
      ),
    );
  }
}
