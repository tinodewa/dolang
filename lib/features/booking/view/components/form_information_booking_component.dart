import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/features/booking/view/components/date_form_component.dart';
import 'package:dolang/features/booking/view/components/label_form_field_component.dart';
import 'package:dolang/features/booking/view/components/time_form_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:dolang/shared/widgets/text_area_custom.dart';
import 'package:dolang/shared/widgets/text_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          Row(
            children: [
              SizedBox(
                width: 0.2.sw,
                child: TextField(
                  controller: BookingController.to.personTotalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '1',
                    hintStyle: GoogleTextStyle.fw400.copyWith(
                      fontSize: 14.sp,
                      color: ColorStyle.greyDark,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorStyle.greyDark,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15.0,
                        ),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorStyle.greyDark,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15.0,
                        ),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorStyle.primary,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15.0,
                        ),
                      ),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  readOnly: false,
                  onChanged: (value) =>
                      BookingController.to.personTotalValue.value = value,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                      RegExp("[0-9a-zA-Z]"),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      BookingController.to.addPerson();
                    },
                    child: const Icon(Icons.add_box_rounded),
                  ),
                  GestureDetector(
                    onTap: () {
                      BookingController.to.reducePerson();
                    },
                    child: const Icon(Icons.indeterminate_check_box_outlined),
                  ),
                ],
              ),
            ],
          ),

          /// Note
          SizedBox(height: 15.h),
          const LabelFormFieldComponent(title: 'Catatan'),
          SizedBox(height: 6.h),
          TextAreaCustoms(
            controller: BookingController.to.noteController,
            keyboardType: TextInputType.text,
            maxLines: 4,
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
