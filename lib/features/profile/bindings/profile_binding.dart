import 'package:dolang/features/profile/controllers/profile_controller.dart';
import 'package:dolang/features/profile/sub_features/bookmark/controllers/profile_bookmark_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.lazyPut(() => BookmarkController());
  }
}
