import 'package:dolang/features/sign_in/controllers/sign_in_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/widgets/text_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FormSignInComponent extends StatelessWidget {
  const FormSignInComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: SignInController.to.formKey,
      child: Column(
        children: [
          // TextFormFieldCustoms(
          //   controller: SignInController.to.emailController,
          //   keyboardType: TextInputType.emailAddress,
          //   initialValue: SignInController.to.emailValue.value,
          //   label: "Email Address",
          //   hint: "Lorem.ipsum@gmail.com",
          //   isRequired: true,
          //   requiredText: "Email address is required!",
          // ),
          SizedBox(
            height: 20.h,
          ),
          // Obx(
          //   () => TextFormFieldCustoms(
          //     controller: SignInController.to.passwordController,
          //     keyboardType: TextInputType.visiblePassword,
          //     initialValue: SignInController.to.passwordValue.value,
          //     label: "Password",
          //     hint: "********",
          //     isRequired: true,
          //     isPassword: SignInController.to.isPassword.value,
          //     requiredText: "Password is required!",
          //     suffixIcon: GestureDetector(
          //       onTap: () => SignInController.to.showPassword(),
          //       child: Align(
          //         widthFactor: 1.0,
          //         heightFactor: 1.0,
          //         child: Icon(
          //           SignInController.to.isPassword.value == true
          //               ? Icons.visibility_off_outlined
          //               : Icons.visibility_outlined,
          //           size: 20,
          //           color: ColorStyle.blackMedium50,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
