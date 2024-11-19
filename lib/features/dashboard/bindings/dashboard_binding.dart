import 'package:dolang/features/dashboard/controllers/dashboard_controller.dart';
import 'package:dolang/features/home/controllers/home_controller.dart';
import 'package:dolang/features/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
  }
}
