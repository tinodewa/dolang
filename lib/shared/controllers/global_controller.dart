import 'dart:io';

import 'package:dolang/constants/core/api_constant.dart';
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
  // RxString statusLocation = RxString('loading');
  // RxString messageLocation = RxString('');
  // RxnString address = RxnString();

  @override
  void onInit() {
    super.onInit();

    /// Check Connection
    checkConnection();
  }

  // @override
  // void onReady() {
  //   super.onReady();

  // getLocation();
  // LocationServices.streamService.listen((status) => getLocation());
  // }

  // Future<void> checkAuth() async {
  //   final isLogin = await LocalStorageService.getAuth();
  //   if (isLogin == null) {
  //     await LocalStorageService.deleteAuth();
  //     Get.offAllNamed(Routes.signInRoute);
  //   } else {
  //     if (isLogin != false) {
  //       Get.offAllNamed(Routes.dashboardRoute);
  //     } else {
  //       Get.offAllNamed(Routes.signInRoute);
  //     }
  //   }
  // }

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

      // Get.offAllNamed(Routes.noConnectionRoute);
    }
  }

  // Future<void> getLocation() async {
  //   if (Get.isDialogOpen == false) {
  //     Get.dialog(const NoLocationScreen(), barrierDismissible: false);
  //   }

  //   try {
  //     /// Mendapatkan lokasi saat ini
  //     statusLocation.value = 'loading';
  //     final locationResult = await LocationServices.getCurrentPosition();

  //     if (locationResult.success) {
  //       /// Jika jarak lokasi cukup dekat, dapatkan informasi alamat
  //       position.value = locationResult.position;
  //       address.value = locationResult.address;
  //       statusLocation.value = 'success';

  //       await Future.delayed(
  //         const Duration(seconds: 1),
  //         checkAuth,
  //       );
  //     } else {
  //       /// Jika jarak lokasi tidak cukup dekat, tampilkan pesan
  //       statusLocation.value = 'error';
  //       messageLocation.value = locationResult.message!;
  //     }
  //   } catch (exception, stackTrace) {
  //     /// Jika terjadi error, tampilkan pesan error
  //     statusLocation.value = 'error';
  //     messageLocation.value = 'Server error: ${exception.toString()}';

  //     await Sentry.captureException(
  //       exception,
  //       stackTrace: stackTrace,
  //     );
  //   }
  // }
}
