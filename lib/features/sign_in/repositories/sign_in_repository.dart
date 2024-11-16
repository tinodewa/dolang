import 'package:dolang/features/sign_in/constants/sign_in_api_constant.dart';

class SignInRepository {
  SignInRepository._();

  /// Singleton instance
  static final SignInRepository _repository = SignInRepository._();

  /// Factory method to get the singleton instance
  factory SignInRepository() {
    return _repository;
  }

  var apiConstant = SignInApiConstant();

  // Future<UsersModel?> loginRequest(String email, String password) async {
  //   try {
  //     final response = await DioService.dioCall(token: 'token').post(
  //       apiConstant.emailPassLogin,
  //       data: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return UsersModel.fromJson(response.data);
  //     } else {
  //       return null;
  //     }
  //   } catch (exception, stackTrace) {
  //     await Sentry.captureException(
  //       exception,
  //       stackTrace: stackTrace,
  //     );
  //     return null;
  //   }
  // }

  // Future<UsersModel?> loginRequestGoogle(
  //     String email, String nama, bool isGoogle) async {
  //   try {
  //     final response = await DioService.dioCall().post(
  //       apiConstant.googleLogin,
  //       data: {
  //         'email': email,
  //         'nama': nama,
  //         'is_google': isGoogle,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return UsersModel.fromJson(response.data);
  //     } else {
  //       return null;
  //     }
  //   } catch (exception, stackTrace) {
  //     await Sentry.captureException(
  //       exception,
  //       stackTrace: stackTrace,
  //     );
  //     return null;
  //   }
  // }

  // Future<void> logout() async {
  //   try {
  //     await DioService.dioCall().get(
  //       '/auth/logout',
  //     );
  //     await LocalStorageService.deleteAuth();

  //     Get.offAllNamed(Routes.signInRoute);
  //   } catch (exception, stackTrace) {
  //     await Sentry.captureException(
  //       exception,
  //       stackTrace: stackTrace,
  //     );
  //   }
  // }
}
