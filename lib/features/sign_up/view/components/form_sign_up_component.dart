import 'package:dolang/features/sign_up/controllers/sign_up_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/widgets/text_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FormSignUpComponent extends StatelessWidget {
  const FormSignUpComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignUpController.to.formSignUpKey,
      child: Column(
        children: [
          TextFormFieldCustoms(
            controller: SignUpController.to.usernameController,
            keyboardType: TextInputType.name,
            initialValue: SignUpController.to.usernameValue.value,
            hint: 'Nama Pengguna'.tr,
            isRequired: true,
            requiredText: 'Nama pengguna tidak boleh kosong!'.tr,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormFieldCustoms(
            controller: SignUpController.to.emailController,
            keyboardType: TextInputType.emailAddress,
            initialValue: SignUpController.to.emailValue.value,
            hint: 'Alamat Email'.tr,
            isRequired: true,
            requiredText: 'Alamat Email tidak boleh kosong!'.tr,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormFieldCustoms(
            controller: SignUpController.to.phoneNumberController,
            keyboardType: TextInputType.phone,
            initialValue: SignUpController.to.phoneNumberValue.value,
            hint: 'Nomor Telpon'.tr,
            isRequired: true,
            requiredText: 'Nomor telpon tidak boleh kosong!'.tr,
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(
            () => TextFormFieldCustoms(
              controller: SignUpController.to.passwordController,
              keyboardType: TextInputType.visiblePassword,
              initialValue: SignUpController.to.passwordValue.value,
              hint: 'Kata Sandi'.tr,
              isRequired: true,
              isPassword: SignUpController.to.isPassword.value,
              requiredText: 'Kata sandi tidak boleh kosong!'.tr,
              suffixIcon: GestureDetector(
                onTap: () => SignUpController.to.showPassword(),
                child: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Icon(
                    SignUpController.to.isPassword.value == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                    color: ColorStyle.blackMedium50,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(
            () => TextFormFieldCustoms(
              controller: SignUpController.to.passwordConfirmationController,
              keyboardType: TextInputType.visiblePassword,
              initialValue: SignUpController.to.passwordConfirmationValue.value,
              hint: 'Konfirmasi Ulang Kata Sandi'.tr,
              isRequired: true,
              isPassword: SignUpController.to.isPasswordConfirmation.value,
              requiredText: 'Konfirmasi kata sandi tidak boleh kosong!'.tr,
              suffixIcon: GestureDetector(
                onTap: () => SignUpController.to.showPasswordConfirmation(),
                child: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Icon(
                    SignUpController.to.isPasswordConfirmation.value == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                    color: ColorStyle.blackMedium50,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
