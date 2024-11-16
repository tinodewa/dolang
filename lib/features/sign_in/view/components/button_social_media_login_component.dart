import 'package:dolang/constants/core/assets/icon_constant.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ButtonSocialMediaLoginComponent extends StatelessWidget {
  const ButtonSocialMediaLoginComponent({
    super.key,
    required this.buttonText,
  })  : bgColor =
            buttonText == 'Google' ? ColorStyle.white : ColorStyle.blackDark,
        textColor =
            buttonText == 'Google' ? ColorStyle.blackDark : ColorStyle.white;

  // Create the bgColor and textColor variables
  final String buttonText;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: TextButton(
        onPressed: () {
          if (buttonText == 'Google') {
            try {
              // SignInController.to.signInWithGoogle(context);
            } catch (exception, stackTrace) {
              Sentry.captureException(
                exception,
                stackTrace: stackTrace,
              );
            }
          } else {
            try {
              // TODO: Implement Apple Sign In
              // SignInController.to.appleSignIn(context);
            } catch (exception, stackTrace) {
              Sentry.captureException(
                exception,
                stackTrace: stackTrace,
              );
            }
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(
              color: ColorStyle.greyDark50,
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add the icon and text to the button
            SvgPicture.asset(
              buttonText == 'Google'
                  ? IconConstant.iconsGoogle
                  : IconConstant.iconsApple,
              semanticsLabel: 'Apple Logo',
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Sign up with ',
              style: GoogleTextStyle.fw400.copyWith(
                fontSize: 14.0,
                color: textColor,
              ),
            ),
            Text(
              buttonText,
              style: GoogleTextStyle.fw700.copyWith(
                fontSize: 14.0,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
