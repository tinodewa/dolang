import 'package:device_info_plus/device_info_plus.dart';
import 'package:dolang/configs/localizations/localization.dart';
import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/features/profile/view/components/language_bottom_sheet_component.dart';
import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  Rx<UsersModel?> userModel = UsersModel().obs;
  RxString deviceModel = ''.obs;
  RxString deviceVersion = ''.obs;
  RxString currentLang = Localization.currentLanguage.obs;

  @override
  void onInit() async {
    super.onInit();
    getUserInformation();
    getDeviceInformation();
  }

  void getUserInformation() async {
    userModel.value = await LocalStorageService.getLoggedUserData();
  }

  void privacyPolicyWebView() {
    Get.toNamed(Routes.profilePrivacyPolicyRoute);
  }

  Future getDeviceInformation() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceModel.value = androidInfo.model;
    deviceVersion.value = androidInfo.version.release;
  }

  Future<void> updateLanguage() async {
    String? language = await Get.bottomSheet(
      LanguageBottomSheetComponent(),
      backgroundColor: ColorStyle.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      isScrollControlled: true,
    );

    if (language != null) {
      Localization.changeLocale(language);
      currentLang(language);
    }
  }

  Future<void> logout() async {
    await LocalStorageService.deleteAuth();
    GlobalController.to.checkAuth();
  }
}
