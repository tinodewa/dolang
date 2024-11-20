import 'package:dolang/features/bookmark/constants/bookmark_api_constant.dart';
import 'package:dolang/features/home/models/bookmark_model.dart';
import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/utils/services/dio_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class BookmarkRepository {
  BookmarkRepository._();

  /// Singleton instance
  static final BookmarkRepository _repository = BookmarkRepository._();

  /// Factory method to get the singleton instance
  factory BookmarkRepository() {
    return _repository;
  }

  var apiConstant = BookmarkApiConstant();

  Future<List<BookmarkModel>?> getBookmarks(String userId) async {
    try {
      final response = await DioService.dioCall().get(
        '${apiConstant.user}/$userId/${apiConstant.bookmark}',
      );

      if (response.statusCode == 200) {
        List<BookmarkModel> bookmarks = [];
        response.data.forEach((bookmark) {
          bookmarks.add(BookmarkModel.fromJson(bookmark));
        });
        return bookmarks;
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
