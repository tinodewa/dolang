import 'package:dolang/features/book_list/constants/book_list_api_constant.dart';
import 'package:dolang/features/book_list/models/book_model.dart';
import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/utils/services/dio_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class BookListRepository {
  BookListRepository._();

  /// Singleton instance
  static final BookListRepository _repository = BookListRepository._();

  /// Factory method to get the singleton instance
  factory BookListRepository() {
    return _repository;
  }

  var apiConstant = BookListApiConstant();

  Future<List<BookModel>?> getBooks(String userId) async {
    try {
      final response = await DioService.dioCall().get(
        '${apiConstant.user}/$userId/${apiConstant.booking}',
      );

      if (response.statusCode == 200) {
        List<BookModel> books = [];
        response.data.forEach((book) {
          books.add(BookModel.fromJson(book));
        });
        return books;
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

  Future<List<DestinationModel>?> getDestinations() async {
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
