import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelFormFieldComponent extends StatelessWidget {
  const LabelFormFieldComponent({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleTextStyle.fw500.copyWith(
        fontSize: 16.sp,
        color: ColorStyle.blackMedium,
      ),
    );
  }
}
