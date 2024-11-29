import 'dart:io';

import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/constants/core/api_constant.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:dolang/utils/services/location_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  /// Check Connection Variable
  var isConnect = false.obs;

  // API
  var baseUrl = ApiConstant.production;
  var isStaging = false.obs;

  /// Location
  LocationServices locationServices = LocationServices();
  RxString statusLocation = RxString('-');
  RxString messageLocation = RxString('');
  Rxn<Position> position = Rxn<Position>();
  RxnString addressFull = RxnString();
  RxnString addressShort = RxnString();

  @override
  void onInit() {
    super.onInit();

    /// Check Connection
    checkConnection();
  }

  @override
  void onReady() {
    super.onReady();

    getLocation();
    LocationServices.streamService.listen((status) => getLocation());
  }

  Future<void> checkAuth() async {
    final isLogin = await LocalStorageService.getAuth();
    if (isLogin == null) {
      await LocalStorageService.deleteAuth();
      // Get.offAllNamed(Routes.signInRoute);
    } else {
      if (isLogin != false) {
        Get.offAllNamed(Routes.dashboardRoute);
      } else {
        Get.offAllNamed(Routes.signInRoute);
      }
    }
  }

  /// Check Connection Setting
  Future<void> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnect.value = true;
      }
    } on SocketException catch (exception, stackTrace) {
      isConnect.value = false;
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      Get.snackbar(
        'Error'.tr,
        'No internet connection.'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    }
  }

  Future<void> getLocation() async {
    try {
      statusLocation.value = 'loading';
      final locationResult = await locationServices.getCurrentPosition();

      if (locationResult.success) {
        position.value = locationResult.position;
        addressFull.value = locationResult.addressFull;
        addressShort.value = locationResult.addressShort;
        statusLocation.value = 'success';
      } else {
        Get.snackbar(
          'Error',
          locationResult.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor,
        );
        statusLocation.value = 'error';
        messageLocation.value = locationResult.message!;
      }
    } catch (exception, stackTrace) {
      /// Jika terjadi error, tampilkan pesan error
      statusLocation.value = 'error';
      messageLocation.value = 'Server error: ${exception.toString()}';

      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }
}
