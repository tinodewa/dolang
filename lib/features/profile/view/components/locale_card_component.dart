import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocaleCardComponent extends StatelessWidget {
  final bool isSelected;
  final String flag;
  final String language;
  final void Function()? onTap;

  const LocaleCardComponent({
    super.key,
    required this.isSelected,
    required this.flag,
    required this.language,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Material(
        borderRadius: BorderRadius.circular(10.r),
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            padding: EdgeInsets.all(10.r),
            color: isSelected
                ? Theme.of(context).primaryColor
                : ColorStyle.greyLight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  flag,
                  width: 46.r,
                  height: 30.r,
                  fit: BoxFit.contain,
                ),
                9.horizontalSpaceRadius,
                Text(
                  language,
                  style: GoogleTextStyle.fw500.copyWith(
                    color: isSelected
                        ? ColorStyle.white
                        : Theme.of(context).primaryColorDark,
                    fontSize: 14.sp,
                  ),
                ),
                ...Conditional.list(
                  context: context,
                  conditionBuilder: (context) => isSelected,
                  widgetBuilder: (context) => [
                    6.horizontalSpaceRadius,
                    Icon(
                      Icons.check,
                      size: 16.r,
                      color: ColorStyle.white,
                    ),
                  ],
                  fallbackBuilder: (context) => [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
