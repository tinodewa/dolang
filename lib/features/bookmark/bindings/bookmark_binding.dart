import 'package:dolang/features/bookmark/controllers/bookmark_controller.dart';
import 'package:get/get.dart';

class BookmarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookmarkController());
  }
}
