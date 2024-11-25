import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/features/booking/models/booking_model.dart';
import 'package:dolang/features/booking/repositories/booking_repository.dart';
import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class BookingController extends GetxController {
  static BookingController get to => Get.find();

  DestinationModel? destination;
  Rx<UsersModel?> userModel = UsersModel().obs;

  /// Page Controller
  var pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  Rx<Time> time = Time(hour: 12, minute: 0).obs;
  RxString date = ''.obs;
  RxInt totalPayment = 0.obs;

  /// Form Variable Setting
  final formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  RxString fullNameValue = ''.obs;
  var phoneNumberController = TextEditingController();
  RxString phoneNumberValue = ''.obs;
  var personTotalController = TextEditingController();
  RxString personTotalValue = '1'.obs;
  var noteController = TextEditingController();
  RxString noteValue = ''.obs;

  /// Repository
  BookingRepository repository = BookingRepository();

  @override
  void onInit() async {
    destination = Get.arguments as DestinationModel;
    super.onInit();
    date.value = DateFormat('dd MMM yyyy').format(
      DateTime.now().add(
        const Duration(days: 1),
      ),
    );
    personTotalController.text = personTotalValue.value;
    userModel.value = await LocalStorageService.getLoggedUserData();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void changePage(int index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCirc,
    );
  }

  void validateFormInformationBooking(context) async {
    await GlobalController.to.checkConnection();

    var isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid && GlobalController.to.isConnect.value == true) {
      fullNameValue.value = fullNameController.text.trim();
      phoneNumberValue.value = phoneNumberController.text.trim();
      personTotalValue.value = personTotalController.text.trim();
      noteValue.value = noteController.text.trim();
      formKey.currentState!.save();
      totalPayment.value = int.parse(personTotalValue.value) *
          int.parse(destination!.pricePerPerson!);
      changePage(1);
    } else {
      PanaraInfoDialog.show(
        context,
        title: 'Peringatan',
        message: 'Mohon periksa kembali data yang anda masukkan!',
        buttonText: 'Ok',
        onTapDismiss: () {
          Get.back();
        },
        panaraDialogType: PanaraDialogType.warning,
        barrierDismissible: false,
      );
    }
  }

  void confirmBooking(context) {
    try {
      PanaraConfirmDialog.show(
        context,
        title: 'Konfirmasi',
        message: 'Apakah anda ingin melakukan pemesanan?',
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
        onTapConfirm: () {
          Get.back();
          saveBookingInformation(context);
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

  void saveBookingInformation(context) async {
    await GlobalController.to.checkConnection();

    if (GlobalController.to.isConnect.value == true) {
      try {
        EasyLoading.show(
          status: 'Tunggu sebentar...',
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false,
        );
        if (userModel.value?.userId != null) {
          BookingModel bookingModel = BookingModel(
            paymentStatus: '1',
            bookerName: fullNameValue.value,
            bookerPhoneNumber: phoneNumberValue.value,
            bookingDate: date.value,
            bookingTime: '${time.value.hour}:${time.value.minute}',
            numberOfPerson: personTotalValue.value,
            notes: noteValue.value,
            totalPayment: totalPayment.value.toString(),
          );
          bool isPosted = await repository.postBooking(
            userModel.value!.userId!,
            destination!.destinationId!,
            bookingModel,
          );
          if (isPosted) {
            PanaraInfoDialog.show(
              context,
              title: 'Pemesanan Berhasil',
              message: 'Pemesanan anda berhasil dilakukan!',
              buttonText: 'Ok',
              onTapDismiss: () {
                Get.offNamedUntil(Routes.dashboardRoute, (route) => false);
              },
              panaraDialogType: PanaraDialogType.success,
              barrierDismissible: false,
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

  void addPerson() {
    int personTotal = int.parse(personTotalValue.value);
    personTotal++;
    personTotalController.text = personTotal.toString();
    personTotalValue.value = personTotal.toString();
  }

  void reducePerson() {
    int personTotal = int.parse(personTotalValue.value);
    if (personTotal > 1) {
      personTotal--;
      personTotalController.text = personTotal.toString();
      personTotalValue.value = personTotal.toString();
    }
  }
}
