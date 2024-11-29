import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemCardInformationComponent extends StatelessWidget {
  const ItemCardInformationComponent({
    super.key,
    required this.destination,
  });

  final DestinationModel destination;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 1.sw,
          height: 65.h,
          decoration: BoxDecoration(
            color: ColorStyle.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(115, 71, 70, 70),
                offset: Offset(0, 2),
                blurRadius: 8,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.r,
              horizontal: 12.r,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 1.sw * 0.5,
                      child: Text(
                        destination.name ?? '',
                        style: GoogleTextStyle.fw500.copyWith(
                          fontSize: 15.sp,
                          color: ColorStyle.blackDark,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          int.parse(destination.pricePerPerson.toString()) != 0
                              ? 'Rp ${destination.pricePerPerson}'
                              : 'Gratis'.tr,
                          style: GoogleTextStyle.fw500.copyWith(
                            fontSize: 15.sp,
                            color: ColorStyle.blackMedium,
                          ),
                        ),
                        Text(
                          int.parse(destination.pricePerPerson.toString()) != 0
                              ? '/${'orang'.tr}'
                              : '',
                          style: GoogleTextStyle.fw400.copyWith(
                            fontSize: 13.sp,
                            color: ColorStyle.blackMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 17.r,
                      color: ColorStyle.greyMedium,
                    ),
                    Text(
                      destination.location ?? '',
                      style: GoogleTextStyle.fw400.copyWith(
                        fontSize: 11.sp,
                        color: ColorStyle.greyDark,
                      ),
                    ),
                    SizedBox(width: 7.w),
                    Text(
                      '|',
                      style: GoogleTextStyle.fw400.copyWith(
                        fontSize: 11.sp,
                        color: ColorStyle.greyMedium,
                      ),
                    ),
                    SizedBox(width: 7.w),
                    Icon(
                      Icons.my_location_sharp,
                      size: 17.r,
                      color: ColorStyle.greyDark,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      '${destination.distance} km',
                      style: GoogleTextStyle.fw400.copyWith(
                        fontSize: 11.sp,
                        color: ColorStyle.greyDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
