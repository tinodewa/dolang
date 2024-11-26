import 'package:dolang/features/book_list/controllers/book_list_controller.dart';
import 'package:dolang/features/book_list/sub_features/detail_book/controllers/book_list_detail_book_controller.dart';
import 'package:get/get.dart';

class BookListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookListController());
    Get.lazyPut(() => BookListDetailBookController());
  }
}
