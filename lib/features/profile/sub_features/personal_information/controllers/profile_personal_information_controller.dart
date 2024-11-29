import 'dart:io';

import 'package:dolang/features/profile/controllers/profile_controller.dart';
import 'package:dolang/features/profile/sub_features/personal_information/repositories/personal_information_repository.dart';
import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/widgets/image_picker_dialog.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ProfilePersonalInformationController extends GetxController {
  static ProfilePersonalInformationController get to => Get.find();

  Rx<UsersModel?> userModel = UsersModel().obs;

  /// Form Variable Setting
  final formPersonalInformationKey = GlobalKey<FormState>();
  var emailValue = ''.obs;
  var usernameController = TextEditingController();
  var usernameValue = ''.obs;
  var phoneNumberController = TextEditingController();
  var phoneNumberValue = ''.obs;
  var addressController = TextEditingController();
  var addressValue = ''.obs;

  /// File photo
  RxString? photo = ''.obs;
  final Rx<File?> _imageFile = Rx<File?>(null);
  File? get imageFile => _imageFile.value;

  /// Repository
  PersonalInformationRepository repository = PersonalInformationRepository();

  @override
  void onInit() async {
    userModel.value = Get.arguments as UsersModel;
    spreadUserData();
    super.onInit();
  }

  void spreadUserData() {
    emailValue.value = userModel.value!.email!;
    usernameController.text = userModel.value!.username!;
    usernameValue.value = userModel.value!.username!;
    phoneNumberController.text = userModel.value!.phoneNumber!;
    phoneNumberValue.value = userModel.value!.phoneNumber!;
    addressController.text = userModel.value!.address!;
    addressValue.value = userModel.value!.address!;
  }

  void confirmEditPersonalInformation(context) {
    try {
      PanaraConfirmDialog.show(
        context,
        title: 'Konfirmasi'.tr,
        message: 'Apakah anda ingin menyimpan perubahan?'.tr,
        confirmButtonText: 'Ya'.tr,
        cancelButtonText: 'Tidak'.tr,
        onTapConfirm: () {
          Get.back();
          updatePersonalInformation();
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

  Future<void> updatePersonalInformation() async {
    await GlobalController.to.checkConnection();

    if (GlobalController.to.isConnect.value == true) {
      EasyLoading.show(
        status: 'Tunggu sebentar...'.tr,
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );
      try {
        if (userModel.value?.userId != null) {
          UsersModel? usermodel = await repository.putPersonalInformation(
            userModel.value!.userId!,
            usernameController.text,
            phoneNumberController.text,
            addressController.text,
          );
          await LocalStorageService.setAuth(usermodel);
          ProfileController.to.getUserInformation();
          Get.snackbar(
            'Berhasil!'.tr,
            'Profil pengguna sudah tersimpan.'.tr,
          );
          EasyLoading.dismiss();
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

  /// Pilih image untuk update photo
  Future<void> pickImage() async {
    try {
      /// Buka dialog untuk sumber gambar
      ImageSource? imageSource = await Get.defaultDialog(
        title: '',
        titleStyle: const TextStyle(fontSize: 0),
        content: const ImagePickerDialog(),
      );

      /// Pengecekan sumber gambar
      if (imageSource == null) return;

      final pickedFile = await ImagePicker().pickImage(
        source: imageSource,
        maxWidth: 300,
        maxHeight: 300,
        imageQuality: 75,
      );

      /// Setelah dipilih, akan terbuka crop gambar
      if (pickedFile != null) {
        _imageFile.value = File(pickedFile.path);

        final croppedFile = await ImageCropper().cropImage(
          sourcePath: _imageFile.value!.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: ColorStyle.complementary,
              toolbarWidgetColor: ColorStyle.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
            )
          ],
        );

        /// Jika gambar telah dipilih, maka akan dimasukkan ke variabel image
        ///  file, karena ini masih menggunakan local file
        if (croppedFile != null) {
          photo?.value = '';
          _imageFile.value = File(croppedFile.path);
        }
      }
    } catch (exception, stackStrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackStrace,
      );
    }
  }
}
