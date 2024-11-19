import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    GlobalController.to.checkAuth();
  }
}
