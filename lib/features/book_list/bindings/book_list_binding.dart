import 'package:dolang/features/book_list/controllers/book_list_controller.dart';
import 'package:get/get.dart';

class BookListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookListController());
  }
}
