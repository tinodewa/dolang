import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/features/booking/view/components/label_form_field_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TimeFormComponent extends StatelessWidget {
  const TimeFormComponent({
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
          const LabelFormFieldComponent(title: 'Waktu*'),
          SizedBox(height: 6.h),
          TextButton.icon(
            icon: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 10.h,
              children: [
                Obx(
                  () => Text(
                    BookingController.to.time.value.format(context),
                    style: GoogleTextStyle.fw400.copyWith(
                      fontSize: 16.sp,
                      color: ColorStyle.blackMedium,
                    ),
                  ),
                ),
                SizedBox(width: 60.w),
                const Icon(
                  Icons.arrow_drop_down,
                  color: ColorStyle.blackMedium,
                ),
              ],
            ),
            label: const Text(''),
            iconAlignment: IconAlignment.end,
            onPressed: () {
              Navigator.of(context).push(
                showPicker(
                  context: context,
                  value: BookingController.to.time.value,
                  is24HrFormat: true,
                  sunrise: const TimeOfDay(hour: 6, minute: 0),
                  sunset: const TimeOfDay(hour: 18, minute: 0),
                  duskSpanInMinutes: 240,
                  onChange: (value) {
                    BookingController.to.time.value = value;
                  },
                ),
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
          SizedBox(height: 22.h),
        ],
      ),
    );
  }
}
