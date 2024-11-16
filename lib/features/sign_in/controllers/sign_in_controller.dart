import 'package:dolang/features/sign_in/repositories/sign_in_repository.dart';
import 'package:dolang/features/sign_in/repositories/signin_firebase.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
  void validateForm(context) async {}

// Create a function to sign in with Google
  void signInWithGoogle(context) async {}
}
