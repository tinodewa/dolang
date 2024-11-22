import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/features/booking/view/components/label_form_field_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateFormComponent extends StatelessWidget {
  const DateFormComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const LabelFormFieldComponent(title: 'Tanggal*'),
          SizedBox(height: 6.h),
          TextButton.icon(
            icon: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 10.h,
              children: [
                Obx(
                  () => Text(
                    BookingController.to.date.value,
                    style: GoogleTextStyle.fw400.copyWith(
                      fontSize: 16.sp,
                      color: ColorStyle.blackMedium,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: ColorStyle.blackMedium,
                ),
              ],
            ),
            label: const Text(''),
            iconAlignment: IconAlignment.end,
            onPressed: () {
              showDatePicker(
                context: Get.context!,
                firstDate: DateTime.now().add(
                  const Duration(days: 1),
                ),
                lastDate: DateTime.now().add(
                  const Duration(days: 30),
                ),
              ).then(
                (value) {
                  if (value != null) {
                    String formattedDate =
                        DateFormat('dd MMM yyyy').format(value);
                    BookingController.to.date.value = formattedDate;
                  }
                },
              );
            },
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(
                Size(double.infinity, 56.h),
              ),
              backgroundColor: WidgetStateProperty.all(
                ColorStyle.white,
              ),
              alignment: Alignment.center,
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: BorderSide(
                    color: ColorStyle.greyDark,
                    width: 1.w,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'Booking maks. h-1',
            style: GoogleTextStyle.fw400.copyWith(
              fontSize: 12.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
        ],
      ),
    );
  }
}
