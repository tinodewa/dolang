import 'package:dolang/features/home/models/bookmark_model.dart';
import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/features/profile/sub_features/bookmark/repositories/bookmark_repository.dart';
import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class BookmarkController extends GetxController {
  static BookmarkController get to => Get.find();
  Rx<UsersModel?> userModel = UsersModel().obs;
  List<BookmarkModel> bookmarkList = <BookmarkModel>[].obs;
  List<DestinationModel> destinationList = <DestinationModel>[].obs;
  List<DestinationModel> finalDestinationList = <DestinationModel>[].obs;
  RxString bookmarkDestinationState = 'loading'.obs;

  /// Repository
  BookmarkRepository repository = BookmarkRepository();

  @override
  void onInit() async {
    super.onInit();
    userModel.value = await LocalStorageService.getLoggedUserData();
    getBookmarks();
  }

  Future<void> getBookmarks() async {
    bookmarkDestinationState('loading');
    await GlobalController.to.checkConnection();

    if (GlobalController.to.isConnect.value == true) {
      try {
        if (userModel.value?.userId != null) {
          List<BookmarkModel>? bookmarks = await repository.getBookmarks(
            userModel.value!.userId!,
          );
          if (bookmarks != null) {
            bookmarkList.assignAll(bookmarks);
            await getDestination();
            if (destinationList.isNotEmpty) {
              finalDestinationList = destinationList
                  .where((destination) => bookmarkList.any(
                        (bookmark) =>
                            destination.destinationId == bookmark.destinationId,
                      ))
                  .toList();
              bookmarkDestinationState('success');
            } else {
              bookmarkDestinationState('error');
            }
          } else {
            bookmarkDestinationState('error');
          }
        }
      } catch (exception, stackTrace) {
        bookmarkDestinationState('error');
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
