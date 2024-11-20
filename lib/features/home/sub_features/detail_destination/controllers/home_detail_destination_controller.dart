import 'package:dolang/features/home/models/bookmark_model.dart';
import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/features/home/sub_features/detail_destination/repositories/detail_destination_repository.dart';
import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDetailDestinationController extends GetxController {
  static HomeDetailDestinationController get to => Get.find();

  DestinationModel? destination;
  RxBool isBookmark = false.obs;
  Rx<UsersModel?> userModel = UsersModel().obs;
  RxString detailDestinationState = 'loading'.obs;
  Rx<BookmarkModel?> bookmarkModel = BookmarkModel().obs;

  /// Repository
  DetailDestinationRepository repository = DetailDestinationRepository();

  @override
  void onInit() async {
    destination = Get.arguments as DestinationModel;
    super.onInit();
    userModel.value = await LocalStorageService.getLoggedUserData();
    checkBookmarkStatus();
  }

  Future<void> openOnMaps() async {
    try {
      await launchUrl(Uri.parse(destination!.mapLocation!));
    } catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> checkBookmarkStatus() async {
    await GlobalController.to.checkConnection();

    if (GlobalController.to.isConnect.value == true) {
      try {
        EasyLoading.show(
          status: 'Tunggu sebentar...',
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false,
        );
        if (userModel.value?.userId != null) {
          List<BookmarkModel>? bookmarkList = await repository.getBookmarks(
            userModel.value!.userId!,
          );
          if (bookmarkList != null) {
            isBookmark.value = false;
            for (var bookmark in bookmarkList) {
              if (bookmark.destinationId == destination!.destinationId) {
                bookmarkModel.value = bookmark;
                isBookmark.value = true;
                detailDestinationState('success');
                EasyLoading.dismiss();
                break;
              }
            }
          }
        }

        detailDestinationState('success');
        EasyLoading.dismiss();
      } catch (exception, stackTrace) {
        detailDestinationState('error');
        EasyLoading.dismiss();
        await Sentry.captureException(
          exception,
          stackTrace: stackTrace,
        );
      }
    }
  }

  void addBookmark() async {
    await GlobalController.to.checkConnection();

    if (GlobalController.to.isConnect.value == true) {
      try {
        EasyLoading.show(
          status: 'Tunggu sebentar...',
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false,
        );
        if (userModel.value?.userId != null) {
          bool isPosted = await repository.postBookmark(
            userModel.value!.userId!,
            destination!.destinationId!,
          );
          if (isPosted) {
            isBookmark.value = true;
            Get.snackbar(
              'Berhasil! menambahkan destinasi!',
              'Yuk cari destinasi lainnya.',
              colorText: ColorStyle.white,
            );
          }
        }
        EasyLoading.dismiss();
      } catch (exception, stackTrace) {
        EasyLoading.dismiss();
        Get.snackbar(
            'Gagal!', 'Terjadi masalah dengan server, coba lagi nanti.');
        await Sentry.captureException(
          exception,
          stackTrace: stackTrace,
        );
      }
    }
  }

  void removeBookmark() async {
    await GlobalController.to.checkConnection();

    if (GlobalController.to.isConnect.value == true) {
      try {
        EasyLoading.show(
          status: 'Tunggu sebentar...',
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false,
        );
        if (userModel.value?.userId != null) {
          bool isDeleted = await repository.removeBookmark(
            userModel.value!.userId!,
            bookmarkModel.value!.bookmarkId!,
          );
          if (isDeleted) {
            isBookmark.value = false;
            Get.snackbar(
              'Berhasil menghapus destinasi!',
              'Yuk cari destinasi lainnya.',
              colorText: ColorStyle.white,
            );
          }
        }
        EasyLoading.dismiss();
      } catch (exception, stackTrace) {
        EasyLoading.dismiss();
        Get.snackbar(
            'Gagal!', 'Terjadi masalah dengan server, coba lagi nanti.');
        await Sentry.captureException(
          exception,
          stackTrace: stackTrace,
        );
      }
    }
  }
}
