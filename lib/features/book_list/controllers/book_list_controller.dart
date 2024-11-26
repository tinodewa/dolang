import 'package:dolang/features/book_list/models/book_model.dart';
import 'package:dolang/features/book_list/repositories/book_list_repository.dart';
import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/utils/enums/data_status.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class BookListController extends GetxController {
  static BookListController get to => Get.find();

  Rx<UsersModel?> userModel = UsersModel().obs;
  List<BookModel> bookList = <BookModel>[].obs;
  List<BookModel> bookListPending = <BookModel>[].obs;
  List<DestinationModel> destinationList = <DestinationModel>[].obs;
  List<DestinationModel> finalDestinationList = <DestinationModel>[].obs;

  Rx<DataStatus> booksState = DataStatus.loading.obs;

  /// Repository
  BookListRepository repository = BookListRepository();

  @override
  void onInit() async {
    super.onInit();
    userModel.value = await LocalStorageService.getLoggedUserData();
    getBooks();
  }

  Future<void> getBooks() async {
    booksState(DataStatus.loading);
    await GlobalController.to.checkConnection();

    if (GlobalController.to.isConnect.value == true) {
      try {
        bookList.clear();
        bookListPending.clear();
        if (userModel.value?.userId != null) {
          List<BookModel>? books = await repository.getBooks(
            userModel.value!.userId!,
          );
          if (books != null) {
            bookList.assignAll(books);
            bookListPending.assignAll(
              bookList.where((book) => book.paymentStatus == '1').toList(),
            );
            await getDestination();
            if (destinationList.isNotEmpty) {
              finalDestinationList = destinationList
                  .where((destination) => bookList.any(
                        (bookmark) =>
                            destination.destinationId == bookmark.destinatonId,
                      ))
                  .toList();
              booksState(DataStatus.success);
            } else {
              booksState(DataStatus.error);
            }
          } else {
            booksState(DataStatus.error);
          }
        }
      } catch (exception, stackTrace) {
        booksState(DataStatus.error);
        await Sentry.captureException(
          exception,
          stackTrace: stackTrace,
        );
      }
    }
  }

  Future<void> getDestination() async {
    try {
      List<DestinationModel>? list = await repository.getDestinations();
      if (list != null) {
        destinationList.assignAll(list);
      }
    } catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }
}
