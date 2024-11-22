import 'package:dolang/features/booking/controllers/booking_controller.dart';
import 'package:get/get.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookingController());
  }
}
