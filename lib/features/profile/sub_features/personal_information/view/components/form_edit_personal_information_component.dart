import 'package:dolang/features/booking/view/components/label_form_field_component.dart';
import 'package:dolang/features/profile/sub_features/personal_information/controllers/profile_personal_information_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:dolang/shared/widgets/text_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FormEditPersonalInformationComponent extends StatelessWidget {
  const FormEditPersonalInformationComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        20.r,
      ),
      child: Form(
        key: ProfilePersonalInformationController.to.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// email disabled
            const LabelFormFieldComponent(title: 'Email'),
            SizedBox(height: 5.h),
            TextFormField(
              initialValue:
                  ProfilePersonalInformationController.to.emailValue.value,
              cursorColor: ColorStyle.blackMedium,
              enabled: false,
              decoration: InputDecoration(
                counterText: "",
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
              ),
              style: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.blackMedium,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            /// username editable
            const LabelFormFieldComponent(title: 'Nama Pengguna'),
            SizedBox(height: 5.h),
            TextFormFieldCustoms(
              controller:
                  ProfilePersonalInformationController.to.usernameController,
              keyboardType: TextInputType.name,
              initialValue:
                  ProfilePersonalInformationController.to.usernameValue.value,
              hint: 'Nama Pengguna'.tr,
              isRequired: true,
              requiredText: 'Nama pengguna tidak boleh kosong!'.tr,
              label: 'Nama Pengguna'.tr,
            ),
            SizedBox(
              height: 20.h,
            ),

            /// phone number editable
            const LabelFormFieldComponent(title: 'Nomor Telpon'),
            SizedBox(height: 5.h),
            TextFormFieldCustoms(
              controller:
                  ProfilePersonalInformationController.to.phoneNumberController,
              keyboardType: TextInputType.phone,
              initialValue: ProfilePersonalInformationController
                  .to.phoneNumberValue.value,
              hint: 'Nomor Telpon',
              isRequired: true,
              requiredText: 'Nomor telpon tidak boleh kosong!'.tr,
            ),
            SizedBox(
              height: 20.h,
            ),

            /// address editable
            const LabelFormFieldComponent(title: 'Alamat'),
            SizedBox(height: 5.h),
            TextFormFieldCustoms(
              controller:
                  ProfilePersonalInformationController.to.addressController,
              keyboardType: TextInputType.phone,
              initialValue:
                  ProfilePersonalInformationController.to.addressValue.value,
              hint: 'Alamat',
              isRequired: true,
              requiredText: 'alamat tidak boleh kosong!'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
