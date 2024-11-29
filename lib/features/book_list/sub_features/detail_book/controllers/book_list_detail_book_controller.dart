import 'package:dolang/features/book_list/controllers/book_list_controller.dart';
import 'package:dolang/features/book_list/models/book_model.dart';
import 'package:dolang/features/book_list/models/detail_book_arguments.dart';
import 'package:dolang/features/book_list/sub_features/detail_book/repositories/detail_book_repository.dart';
import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:dolang/utils/services/location_services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class BookListDetailBookController extends GetxController {
  static BookListDetailBookController get to => Get.find();

  DestinationModel? destination;
  BookModel? book;
  Rx<UsersModel?> userModel = UsersModel().obs;

  /// Repository
  DetailBookRepository repository = DetailBookRepository();
  LocationServices locationServices = LocationServices();

  @override
  void onInit() async {
    var detailBookArguments = Get.arguments as DetailBookArguments;
    destination = detailBookArguments.destination;
    book = detailBookArguments.book;
    super.onInit();
    userModel.value = await LocalStorageService.getLoggedUserData();
    await getDistance();
  }

  void confirmCancelBook(context) {
    try {
      PanaraConfirmDialog.show(
        context,
        title: 'Konfirmasi'.tr,
        message: 'Apakah anda ingin membatalkan pemesanan?'.tr,
        confirmButtonText: 'Ya'.tr,
        cancelButtonText: 'Tidak'.tr,
        onTapConfirm: () {
          Get.back();
          cancelBook();
        },
        onTapCancel: () {
          Get.back();
        },
        panaraDialogType: PanaraDialogType.warning,
      );
    } catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> cancelBook() async {
    await GlobalController.to.checkConnection();

    if (GlobalController.to.isConnect.value == true) {
      EasyLoading.show(
        status: 'Tunggu sebentar...'.tr,
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );
      try {
        if (userModel.value?.userId != null) {
          await repository.putCancelBook(
            userModel.value!.userId!,
            book!.bookingId!,
          );
          await BookListController.to.getBooks();
          EasyLoading.dismiss();
          Get.back();
        }
      } catch (exception, stackTrace) {
        EasyLoading.dismiss();
        await Sentry.captureException(
          exception,
          stackTrace: stackTrace,
        );
      }
    }
  }

  void confirmPaymentBook(context) {
    try {
      PanaraConfirmDialog.show(
        context,
        title: 'Konfirmasi'.tr,
        message: 'Apakah anda ingin membayar pemesanan?'.tr,
        confirmButtonText: 'Ya'.tr,
        cancelButtonText: 'Tidak'.tr,
        onTapConfirm: () {
          Get.back();
          paymentBook();
        },
        onTapCancel: () {
          Get.back();
        },
        panaraDialogType: PanaraDialogType.warning,
      );
    } catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> paymentBook() async {
    await GlobalController.to.checkConnection();

    if (GlobalController.to.isConnect.value == true) {
      EasyLoading.show(
        status: 'Tunggu sebentar...'.tr,
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );
      try {
        if (userModel.value?.userId != null) {
          await repository.putCompletePaymentBook(
            userModel.value!.userId!,
            book!.bookingId!,
          );
          await BookListController.to.getBooks();
          EasyLoading.dismiss();
          Get.back();
        }
      } catch (exception, stackTrace) {
        EasyLoading.dismiss();
        await Sentry.captureException(
          exception,
          stackTrace: stackTrace,
        );
      }
    }
  }

  Future<void> getDistance() async {
    try {
      if (locationServices.locationEnabled == null &&
          locationServices.locationEnabled == false) {
        await locationServices.getCurrentPosition();
      }

      if (destination != null) {
        double distance = locationServices.getDistanceBetween(
          endLatitude: double.parse(destination!.latitude.toString()),
          endLongitude: double.parse(destination!.longitude.toString()),
        );
        destination!.distance = meterToKm(distance).toString();
      }
    } catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  int meterToKm(double meter) {
    return (meter / 1000).round();
  }
}
