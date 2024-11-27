import 'package:dolang/configs/localizations/localization.dart';
import 'package:dolang/features/profile/view/components/locale_card_component.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LanguageBottomSheetComponent extends StatelessWidget {
  LanguageBottomSheetComponent({super.key});

  Rx<Locale> selectedLocale = Rx<Locale>(Localization.currentLocale);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 17.r,
        vertical: 19.r,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 104,
              height: 4,
              decoration: BoxDecoration(
                color: ColorStyle.greyDark50,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          16.verticalSpacingRadius,
          Text(
            'Change language'.tr,
            style: GoogleTextStyle.fw700.copyWith(
              fontSize: 18.sp,
              color: ColorStyle.blackMedium,
            ),
          ),
          16.verticalSpacingRadius,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (i) {
                if (i == 1) {
                  return SizedBox(
                    width: 10.w,
                  );
                } else if (i == 2) {
                  return LocaleCardComponent(
                    isSelected:
                        selectedLocale.value == Localization.locales[i - 1],
                    flag: Localization.flags[i - 1],
                    language: Localization.langs[i - 1],
                    onTap: () {
                      selectedLocale(Localization.locales[i - 1]);
                      Get.back(result: Localization.langs[i - 1]);
                    },
                  );
                } else {
                  return LocaleCardComponent(
                    isSelected: selectedLocale.value == Localization.locales[i],
                    flag: Localization.flags[i],
                    language: Localization.langs[i],
                    onTap: () {
                      selectedLocale(Localization.locales[i]);
                      Get.back(result: Localization.langs[i]);
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
