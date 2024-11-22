import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:dolang/shared/widgets/tile_option_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileConfirmationComponent extends StatelessWidget {
  const TileConfirmationComponent({
    super.key,
    required this.title,
    required this.message,
  });
  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    return TileOptionComponent(
      title: title,
      message: message,
      titleStyle: GoogleTextStyle.fw400.copyWith(
        fontSize: 16.sp,
        color: ColorStyle.blackMedium,
      ),
      messageStyle: GoogleTextStyle.fw600.copyWith(
        fontSize: 16.sp,
        color: ColorStyle.blackMedium,
      ),
    );
  }
}
