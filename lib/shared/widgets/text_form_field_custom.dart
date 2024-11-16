import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldCustoms extends StatelessWidget {
  const TextFormFieldCustoms({
    super.key,
    required this.controller,
    required this.keyboardType,
    this.initialValue,
    this.label,
    required this.hint,
    this.isPassword = false,
    this.isRequired = false,
    this.requiredText = "Input tidak boleh kosong",
    this.maxLength,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? initialValue;
  final String? label;
  final String hint;
  final bool isPassword;
  final bool isRequired;
  final String requiredText;
  final int? maxLength;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          keyboardType: keyboardType,
          obscureText: isPassword,
          maxLength: maxLength,
          initialValue: initialValue,
          cursorColor: ColorStyle.blackMedium,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleTextStyle.fw400.copyWith(
              fontSize: 14.sp,
              color: ColorStyle.greyDark,
            ),
            counterText: "",
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 10.h,
            ),
            suffixIcon: SizedBox.shrink(child: suffixIcon),
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
          onChanged: (text) {
            controller.text = text;
          },
          validator: (String? value) {
            if (isRequired == true) {
              String trim = value!.trim();
              if (trim.isEmpty) {
                return requiredText;
              }
            }
            return null;
          },
          style: GoogleTextStyle.fw400.copyWith(
            fontSize: 14.sp,
            color: ColorStyle.blackDark,
          ),
        )
      ],
    );
  }
}
