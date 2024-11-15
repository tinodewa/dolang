import 'package:dolang/configs/localizations/en/en_us.dart';
import 'package:dolang/configs/localizations/id/id_id.dart';
import 'package:dolang/constants/core/assets/image_constant.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// localization class
class Localization extends Translations {
// default locale constant
  static const defaultLocale = Locale('en', 'US');

// fallback locale constant
  static const fallbackLocale = Locale('id', 'ID');

// supported languages constant
  static const langs = [
    'English',
    'Indonesia',
  ];

  // flags asset image list constant
  static const flags = [
    ImageConstant.flagEn,
    ImageConstant.flagInd,
  ];

  // locale list constant
  static const locales = [
    Locale('en', 'US'),
    Locale('id', 'ID'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': translationsEnUs,
        'id_ID': translationsIDID,
      };

  // change locale
  static void changeLocale(String lang) async {
    final locale = getLocalFromLanguage(lang);
    await Get.updateLocale(locale);
  }

  // search for language and return locale
  static Locale getLocalFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (langs[i].toLowerCase() == lang.toLowerCase()) {
        return locales[i];
      }
    }

    return defaultLocale;
  }

  // get current locale
  static Locale get currentLocale {
    return Get.locale ?? defaultLocale;
  }

  // get current language
  static String get currentLanguage {
    return langs.elementAt(locales.indexOf(currentLocale));
  }
}
