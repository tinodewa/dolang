import 'package:dolang/features/profile/constants/profile_api_constant.dart';
import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:dolang/utils/services/dio_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class PersonalInformationRepository {
  PersonalInformationRepository._();

  /// Singleton instance
  static final PersonalInformationRepository _repository =
      PersonalInformationRepository._();

  /// Factory method to get the singleton instance
  factory PersonalInformationRepository() {
    return _repository;
  }

  var apiConstant = ProfileApiConstant();

  Future<UsersModel?> putPersonalInformation(
    String userId,
    String username,
    String phoneNumber,
    String address,
  ) async {
    try {
      final response = await DioService.dioCall().put(
        '${apiConstant.user}/$userId',
        data: {
          'username': username,
          "phone_number": phoneNumber,
          "address": address,
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
