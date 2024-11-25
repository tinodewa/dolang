import 'package:dolang/features/home/sub_features/detail_destination/controllers/home_detail_destination_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainInfoDestinationComponent extends StatelessWidget {
  const MainInfoDestinationComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            HomeDetailDestinationController.to.destination?.name ?? '',
            style: GoogleTextStyle.fw500.copyWith(
              fontSize: 18.sp,
              color: ColorStyle.blackDark,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              int.parse(HomeDetailDestinationController
                          .to.destination!.pricePerPerson!
                          .toString()) !=
                      0
                  ? 'Rp ${HomeDetailDestinationController.to.destination?.pricePerPerson}'
                  : 'Gratis',
              style: GoogleTextStyle.fw500.copyWith(
                fontSize: 15.sp,
                color: ColorStyle.blackMedium,
              ),
            ),
            Text(
              int.parse(HomeDetailDestinationController
                          .to.destination!.pricePerPerson!
                          .toString()) !=
                      0
                  ? '/orang'
                  : '',
              style: GoogleTextStyle.fw400.copyWith(
                fontSize: 13.sp,
                color: ColorStyle.blackMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
