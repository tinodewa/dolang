import 'package:dolang/features/sign_in/constants/sign_in_api_constant.dart';
import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/utils/services/dio_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SignInRepository {
  SignInRepository._();

  /// Singleton instance
  static final SignInRepository _repository = SignInRepository._();

  /// Factory method to get the singleton instance
  factory SignInRepository() {
    return _repository;
  }

  var apiConstant = SignInApiConstant();

  Future<List<UsersModel>?> getUsers() async {
    try {
      final response = await DioService.dioCall().get(
        apiConstant.login,
      );

      if (response.statusCode == 200) {
        List<UsersModel> users = [];
        response.data.forEach((user) {
          users.add(UsersModel.fromJson(user));
        });
        return users;
      } else {
        return null;
      }
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  Future<UsersModel?> createuser(
    String? username,
    String? email,
    String? photoUrl,
    String? phoneNumber,
    String? password,
  ) async {
    try {
      final response = await DioService.dioCall().post(
        apiConstant.login,
        data: {
          'username': username ?? '',
          'password': password ?? '',
          'email': email ?? '',
          'phone_number': phoneNumber ?? '',
          'photoUrl': photoUrl ?? '',
          'address': '',
          'createdAt': DateTime.now().toString(),
          'updatedAt': DateTime.now().toString(),
        },
      );

      if (response.statusCode == 201) {
        return UsersModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  Future<UsersModel?> loginRequestGoogle(
      String email, String nama, bool isGoogle) async {
    try {
      final response = await DioService.dioCall().post(
        apiConstant.login,
        data: {
          'email': email,
          'nama': nama,
          'is_google': isGoogle,
        },
      );

      if (response.statusCode == 200) {
        return UsersModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return null;
    }
  }
}
