import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ButtonInformationCheckComponent extends StatelessWidget {
  const ButtonInformationCheckComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.r,
          right: 20.r,
          bottom: 20.r,
        ),
        child: TextButton(
          onPressed: () {
            try {
              BookingController.to.validateFormInformationBooking(context);
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
            'Selanjutnya',
            style: GoogleTextStyle.fw700.copyWith(
              fontSize: 14.0,
              color: ColorStyle.blackMedium,
            ),
          ),
        ),
      ),
    );
  }
}
