import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/features/sign_in/repositories/sign_in_repository.dart';
import 'package:dolang/features/sign_in/repositories/signin_firebase.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:dolang/utils/services/local_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();

  /// Form Variable Setting
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var emailValue = ''.obs;
  var passwordController = TextEditingController();
  var passwordValue = ''.obs;
  var isPassword = true.obs;
  var isRememberme = false.obs;

  /// Repository
  SignInRepository repository = SignInRepository();
  SignInFirebase signInFirebase = SignInFirebase();

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

  // Create a function to sign in with email and password via API
  void validateForm(context) async {
    await GlobalController.to.checkConnection();

    var isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid && GlobalController.to.isConnect.value == true) {
      EasyLoading.show(
        status: 'Being processed...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );

      formKey.currentState!.save();
      try {
        UsersModel? usersModel = await checkEmailRegistered(
          emailController.text,
        );
        if (usersModel != null) {
          await LocalStorageService.setAuth(usersModel);
          EasyLoading.dismiss();
          GlobalController.to.checkAuth();
        } else {
          EasyLoading.dismiss();
          PanaraInfoDialog.show(
            context,
            title: 'Warning',
            message: 'Wrong Email & Password',
            buttonText: 'Confirm',
            onTapDismiss: () {
              Get.back();
            },
            panaraDialogType: PanaraDialogType.warning,
            barrierDismissible: false,
          );
        }
      } catch (exception, stackTrace) {
        EasyLoading.dismiss();
        PanaraInfoDialog.show(
          context,
          title: 'Warning',
          message: 'Unexpected error, try again later!',
          buttonText: 'Confirm',
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
    } else if (GlobalController.to.isConnect.value == false) {
      Get.toNamed(Routes.noConnectionRoute);
    }
  }

  // Create a function to sign in with Google
  void signInWithGoogle(context) async {
    try {
      await GlobalController.to.checkConnection();
      EasyLoading.show(
        status: 'Sedang diproses...'.tr,
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );

      // Trigger the Google Sign In process
      UserCredential? googleAuth = await signInFirebase.signInWithGoogle();

      if (googleAuth?.user != null) {
        UsersModel? usersModel = await checkEmailRegistered(
          googleAuth!.user!.email!,
        );
        if (usersModel != null) {
          await LocalStorageService.setAuth(usersModel);
          EasyLoading.dismiss();
          GlobalController.to.checkAuth();
        } else {
          UsersModel? usersModel = await repository.createuser(
            googleAuth.user!.displayName!,
            googleAuth.user!.email!,
            googleAuth.user!.photoURL!,
            '',
            '',
          );
          await LocalStorageService.setAuth(usersModel);
          EasyLoading.dismiss();
          GlobalController.to.checkAuth();
        }
        Get.toNamed(Routes.dashboardRoute);
      } else {
        EasyLoading.dismiss();
        PanaraInfoDialog.show(
          context,
          title: 'Warning',
          message: 'Failed!',
          buttonText: 'Ok',
          onTapDismiss: () {
            Get.back();
          },
          panaraDialogType: PanaraDialogType.warning,
          barrierDismissible: false,
        );
      }
    } catch (exception, stackTrace) {
      EasyLoading.dismiss();
      PanaraInfoDialog.show(
        context,
        title: 'Warning',
        message: 'Failed!',
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
  }

  // check email is already registered
  Future<UsersModel?> checkEmailRegistered(String email) async {
    try {
      await GlobalController.to.checkConnection();

      List<UsersModel>? usersModel = await repository.getUsers();
      if (usersModel != null) {
        for (var user in usersModel) {
          if (user.email == email) {
            return user;
          }
        }
      }
      return null;
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return null;
    }
  }
}
