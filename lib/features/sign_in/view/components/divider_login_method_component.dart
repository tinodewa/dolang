import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DividerLoginMethodComponent extends StatelessWidget {
  const DividerLoginMethodComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Add the first divider
        const Flexible(
          child: Divider(
            color: ColorStyle.greyDark50,
          ),
        ),
        // Add the text in the middle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Text(
            'atau'.tr,
            style: const TextStyle(
              color: ColorStyle.blackMedium,
              backgroundColor: Colors.transparent,
              fontSize: 14.0,
            ),
          ),
        ),
        // Add the second divider
        const Flexible(
          child: Divider(
            color: ColorStyle.greyDark50,
          ),
        ),
      ],
    );
  }
}
