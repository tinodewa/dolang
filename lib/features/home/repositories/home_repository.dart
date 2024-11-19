import 'package:dolang/features/home/constants/home_api_constant.dart';
import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/utils/services/dio_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class HomeRepository {
  HomeRepository._();

  /// Singleton instance
  static final HomeRepository _repository = HomeRepository._();

  /// Factory method to get the singleton instance
  factory HomeRepository() {
    return _repository;
  }

  var apiConstant = HomeApiConstant();

  Future<List<DestinationModel>?> getDestination() async {
    try {
      final response = await DioService.dioCall().get(
        apiConstant.destination,
      );

      if (response.statusCode == 200) {
        List<DestinationModel> destinations = [];
        response.data.forEach((destination) {
          destinations.add(DestinationModel.fromJson(destination));
        });
        return destinations;
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
