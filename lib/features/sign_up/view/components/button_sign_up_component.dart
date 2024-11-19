import 'package:dolang/features/sign_up/controllers/sign_up_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ButtonSignupComponent extends StatelessWidget {
  const ButtonSignupComponent({
    super.key,
    required this.buttonText,
  });

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44.0,
      child: TextButton(
        onPressed: () {
          try {
            SignUpController.to.validateForm(context);
          } catch (exception, stackTrace) {
            Sentry.captureException(
              exception,
              stackTrace: stackTrace,
            );
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: ColorStyle.primaryLight,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(
              color: ColorStyle.primaryLight,
              width: 1.5,
            ),
          ),
          shadowColor: ColorStyle.primary,
          elevation: 3,
        ),
        child: Text(
          buttonText,
          style: GoogleTextStyle.fw700.copyWith(
            fontSize: 14.0,
            color: ColorStyle.blackMedium,
          ),
        ),
      ),
    );
  }
}
