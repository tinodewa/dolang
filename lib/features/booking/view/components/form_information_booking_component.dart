import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:dolang/shared/widgets/text_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormInformationBookingComponent extends StatelessWidget {
  const FormInformationBookingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BookingController.to.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Full Name
          Text(
            'Nama Lengkap*',
            style: GoogleTextStyle.fw500.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          SizedBox(height: 6.h),
          TextFormFieldCustoms(
            controller: BookingController.to.fullNameController,
            keyboardType: TextInputType.name,
            initialValue: BookingController.to.fullNameValue.value,
            hint: 'Masukkan Nama Lengkap'.tr,
            isRequired: true,
            requiredText: 'Nama lengkap tidak boleh kosong!'.tr,
          ),

          /// Phone Number
          SizedBox(height: 15.h),
          Text(
            'Nomor Telpon*',
            style: GoogleTextStyle.fw500.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          SizedBox(height: 6.h),
          TextFormFieldCustoms(
            controller: BookingController.to.phoneNumberController,
            keyboardType: TextInputType.phone,
            initialValue: BookingController.to.phoneNumberValue.value,
            hint: 'Masukkan Nomor Telpon'.tr,
            isRequired: true,
            requiredText: 'Nomor telpon tidak boleh kosong!'.tr,
          ),

          /// Date Time
          SizedBox(height: 15.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal*',
                      style: GoogleTextStyle.fw500.copyWith(
                        fontSize: 16.sp,
                        color: ColorStyle.blackMedium,
                      ),
                    ),
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
              ),

              SizedBox(width: 15.w),

              /// Waktu
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Waktu*',
                      style: GoogleTextStyle.fw500.copyWith(
                        fontSize: 16.sp,
                        color: ColorStyle.blackMedium,
                      ),
                    ),
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
              ),
            ],
          ),

          /// Number of Person
          SizedBox(height: 15.h),
          Text(
            'Jumlah Orang*',
            style: GoogleTextStyle.fw500.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          SizedBox(height: 6.h),
          TextFormFieldCustoms(
            controller: BookingController.to.personTotalController,
            keyboardType: TextInputType.number,
            initialValue: BookingController.to.personTotalValue.value,
            hint: 'Masukkan Jumlah Orang'.tr,
            isRequired: true,
            requiredText: 'Jumlah Orang tidak boleh kosong!'.tr,
          ),

          /// Note
          SizedBox(height: 15.h),
          Text(
            'Catatan',
            style: GoogleTextStyle.fw500.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          SizedBox(height: 6.h),
          TextFormFieldCustoms(
            controller: BookingController.to.noteController,
            keyboardType: TextInputType.text,
            initialValue: BookingController.to.noteValue.value,
            hint: 'Masukkan Catatan'.tr,
            isRequired: false,
            requiredText: 'Catatan tidak boleh kosong!'.tr,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
