import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/features/sign_up/repositories/sign_up_repository.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();

  /// Form Variable Setting
  final formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var usernameValue = ''.obs;
  var emailController = TextEditingController();
  var emailValue = ''.obs;
  var phoneNumberController = TextEditingController();
  var phoneNumberValue = ''.obs;
  var passwordController = TextEditingController();
  var passwordValue = ''.obs;
  var passwordConfirmationController = TextEditingController();
  var passwordConfirmationValue = ''.obs;
  var isPassword = true.obs;
  var isPasswordConfirmation = true.obs;

  RxBool isConfirmationApproved = false.obs;

  /// Repository
  SignUpRepository repository = SignUpRepository();

  @override
  void onInit() async {
    super.onInit();

    // Check connection
    await GlobalController.to.checkConnection();
  }

  /// Create a function to change the password visibility
  showPassword() async {
    try {
      isPassword.value = !isPassword.value;
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  /// Create a function to change the password confirmation visibility
  showPasswordConfirmation() async {
    try {
      isPasswordConfirmation.value = !isPasswordConfirmation.value;
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  // Create a function to sign up with email and password via API
  void validateForm(context) async {
    await GlobalController.to.checkConnection();

    var isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid && GlobalController.to.isConnect.value == true) {
      var isPasswordMatch =
          passwordController.text == passwordConfirmationController.text;
      if (isPasswordMatch) {
        if (isConfirmationApproved.value) {
          EasyLoading.show(
            status: 'Tunggu sebentar...',
            maskType: EasyLoadingMaskType.black,
            dismissOnTap: false,
          );

          formKey.currentState!.save();
          try {
            bool isRegistered = await checkEmailRegistered(
              emailController.text,
            );
            if (isRegistered) {
              EasyLoading.dismiss();
              PanaraInfoDialog.show(
                context,
                title: 'Perhatian!',
                message: 'Email sudah terdaftar.',
                buttonText: 'Ok',
                onTapDismiss: () {
                  Get.back();
                },
                panaraDialogType: PanaraDialogType.warning,
                barrierDismissible: false,
              );
            } else {
              UsersModel? usersModel = await repository.createuser(
                usernameController.text,
                emailController.text,
                '',
                phoneNumberController.text,
                passwordController.text,
              );
              await LocalStorageService.setAuth(usersModel);
              EasyLoading.dismiss();
              GlobalController.to.checkAuth();
            }
          } catch (exception, stackTrace) {
            EasyLoading.dismiss();
            PanaraInfoDialog.show(
              context,
              title: 'Perhatian!',
              message: 'Error, coba lagi nanti.',
              buttonText: 'Ok',
              onTapDismiss: () {
                Get.back();
              },
              panaraDialogType: PanaraDialogType.warning,
              barrierDismissible: false,
            );
            await Sentry.captureException(
              exception,
              stackTrace: stackTrace,
            );
          }
        } else {
          PanaraInfoDialog.show(
            context,
            title: 'Perhatian!',
            message: 'Mohon konfirmasi privasi pengguna dan kebijakan.',
            buttonText: 'Ok',
            onTapDismiss: () {
              Get.back();
            },
            panaraDialogType: PanaraDialogType.warning,
            barrierDismissible: false,
          );
        }
      } else {
        PanaraInfoDialog.show(
          context,
          title: 'Perhatian!',
          message: 'Password dan Konfirmasi Password tidak sama.',
          buttonText: 'Ok',
          onTapDismiss: () {
            Get.back();
          },
          panaraDialogType: PanaraDialogType.warning,
          barrierDismissible: false,
        );
      }
    }
  }

  // check email is already registered
  Future<bool> checkEmailRegistered(String email) async {
    try {
      await GlobalController.to.checkConnection();

      List<UsersModel>? usersModel = await repository.getUsers();
      if (usersModel != null) {
        for (var user in usersModel) {
          if (user.email == email) {
            return true;
          }
        }
      }
      return false;
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return false;
    }
  }
}
