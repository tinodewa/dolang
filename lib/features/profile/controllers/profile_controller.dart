import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  Rx<UsersModel?> userModel = UsersModel().obs;

  @override
  void onInit() async {
    super.onInit();
    userModel.value = await LocalStorageService.getLoggedUserData();
  }

  Future<void> logout() async {
    await LocalStorageService.deleteAuth();
    GlobalController.to.checkAuth();
  }
}
