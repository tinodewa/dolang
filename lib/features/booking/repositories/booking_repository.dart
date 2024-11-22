import 'package:dolang/features/booking/constants/booking_api_constant.dart';
import 'package:dolang/features/booking/models/booking_model.dart';
import 'package:dolang/utils/services/dio_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class BookingRepository {
  BookingRepository._();

  /// Singleton instance
  static final BookingRepository _repository = BookingRepository._();

  /// Factory method to get the singleton instance
  factory BookingRepository() {
    return _repository;
  }

  var apiConstant = BookingApiConstant();

  Future<bool> postBooking(
    String userId,
    String destinationId,
    BookingModel bookingModel,
  ) async {
    try {
      final response = await DioService.dioCall().post(
        '${apiConstant.user}/$userId/${apiConstant.booking}',
        data: {
          "destinaton_id": userId,
          "user_id": destinationId,
          "booker_name": bookingModel.bookerName,
          "booker_phone_number": bookingModel.bookerPhoneNumber,
          "booking_date": bookingModel.bookingDate,
          "booking_time": bookingModel.bookingTime,
          "number_of_person": bookingModel.numberOfPerson,
          "notes": bookingModel.notes,
          "total_payment": bookingModel.totalPayment,
          "payment_status": '1',
          "createdAt": DateTime.now().toString(),
          "updatedAt": DateTime.now().toString(),
        },
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return false;
    }
  }
}
