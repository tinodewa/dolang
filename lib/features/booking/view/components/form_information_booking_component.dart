import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/features/booking/view/components/date_form_component.dart';
import 'package:dolang/features/booking/view/components/label_form_field_component.dart';
import 'package:dolang/features/booking/view/components/time_form_component.dart';
import 'package:dolang/shared/widgets/text_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          const LabelFormFieldComponent(title: 'Nama Lengkap*'),
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
          const LabelFormFieldComponent(title: 'Nomor Telpon*'),
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
              const DateFormComponent(),

              SizedBox(width: 15.w),

              /// Waktu
              const TimeFormComponent(),
            ],
          ),

          /// Number of Person
          SizedBox(height: 15.h),

          const LabelFormFieldComponent(title: 'Jumlah Orang*'),
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
          const LabelFormFieldComponent(title: 'Catatan'),
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
