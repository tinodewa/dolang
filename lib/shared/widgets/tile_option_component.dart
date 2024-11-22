import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TileOptionComponent extends StatelessWidget {
  const TileOptionComponent({
    super.key,
    this.icon,
    required this.title,
    this.subtitle,
    required this.message,
    this.messageSubtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.messageStyle,
    this.messageSubtitleStyle,
    this.onTap,
    this.iconSize,
    this.messageMaxLines,
  });

  final String? icon;
  final String title;
  final String? subtitle;
  final String message;
  final String? messageSubtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? messageStyle;
  final TextStyle? messageSubtitleStyle;
  final void Function()? onTap;
  final double? iconSize;
  final int? messageMaxLines;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Conditional.single(
                context: context,
                conditionBuilder: (context) => icon == null,
                widgetBuilder: (context) => 5.horizontalSpace,
                fallbackBuilder: (context) => Container(
                  constraints: BoxConstraints(
                    minWidth: (iconSize ?? 20.r) * 2,
                  ),
                  child: SvgPicture.asset(
                    icon!,
                    height: iconSize ?? 20.r,
                    width: iconSize ?? 20.r,
                  ),
                ),
              ),
              Text(
                title,
                style: titleStyle ?? Get.textTheme.titleSmall,
              ),

              /// Text Messages
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      message,
                      style: messageStyle ?? Get.textTheme.bodyMedium,
                      textAlign: TextAlign.end,
                      maxLines: messageMaxLines,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Conditional.single(
                      context: context,
                      conditionBuilder: (context) => messageSubtitle != null,
                      widgetBuilder: (context) => Text(
                        messageSubtitle!,
                        textAlign: TextAlign.end,
                        style: messageSubtitleStyle ??
                            GoogleTextStyle.fw400.copyWith(
                              fontSize: 10.sp,
                              color: ColorStyle.greyDark,
                              height: 1.219,
                            ),
                      ),
                      fallbackBuilder: (context) => const SizedBox(),
                    ),
                  ],
                ),
              ),

              /// Icon right chevron
              Conditional.single(
                context: context,
                conditionBuilder: (context) => onTap != null,
                widgetBuilder: (context) => const Icon(
                  Icons.chevron_right,
                  color: ColorStyle.greyMedium,
                ),
                fallbackBuilder: (context) => 5.horizontalSpaceRadius,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
