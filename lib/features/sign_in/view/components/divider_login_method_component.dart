import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';

class DividerLoginMethodComponent extends StatelessWidget {
  const DividerLoginMethodComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Add the first divider
        Flexible(
          child: Divider(
            color: ColorStyle.greyDark,
          ),
        ),
        // Add the text in the middle
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'or',
            style: TextStyle(
              color: ColorStyle.greyDark,
              backgroundColor: Colors.transparent,
              fontSize: 14.0,
            ),
          ),
        ),
        // Add the second divider
        Flexible(
          child: Divider(
            color: ColorStyle.greyDark,
          ),
        ),
      ],
    );
  }
}
