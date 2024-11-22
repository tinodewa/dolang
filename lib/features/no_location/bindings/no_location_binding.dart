import 'package:dolang/features/no_location/controllers/no_location_controller.dart';
import 'package:get/get.dart';

class NoLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NoLocationController());
  }
}
