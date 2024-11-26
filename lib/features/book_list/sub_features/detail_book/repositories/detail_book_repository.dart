import 'package:dolang/features/book_list/constants/book_list_api_constant.dart';
import 'package:dolang/features/book_list/models/book_model.dart';
import 'package:dolang/utils/services/dio_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class DetailBookRepository {
  DetailBookRepository._();

  /// Singleton instance
  static final DetailBookRepository _repository = DetailBookRepository._();

  /// Factory method to get the singleton instance
  factory DetailBookRepository() {
    return _repository;
  }

  var apiConstant = BookListApiConstant();

  Future<BookModel?> putCancelBook(
    String userId,
    String bookId,
  ) async {
    try {
      final response = await DioService.dioCall().put(
        '${apiConstant.user}/$userId/${apiConstant.booking}/$bookId',
        data: {
          'payment_status': '3',
        },
      );

      if (response.statusCode == 200) {
        return BookModel.fromJson(response.data);
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

  Future<BookModel?> putCompletePaymentBook(
    String userId,
    String bookId,
  ) async {
    try {
      final response = await DioService.dioCall().put(
        '${apiConstant.user}/$userId/${apiConstant.booking}/$bookId',
        data: {
          'payment_status': '2',
        },
      );

      if (response.statusCode == 200) {
        return BookModel.fromJson(response.data);
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
