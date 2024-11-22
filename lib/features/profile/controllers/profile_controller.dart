import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  Future<void> logout() async {
    await LocalStorageService.deleteAuth();
    GlobalController.to.checkAuth();
  }
}
