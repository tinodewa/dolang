import 'package:dolang/features/home/constants/home_api_constant.dart';
import 'package:dolang/features/home/models/bookmark_model.dart';
import 'package:dolang/utils/services/dio_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class DetailDestinationRepository {
  DetailDestinationRepository._();

  /// Singleton instance
  static final DetailDestinationRepository _repository =
      DetailDestinationRepository._();

  /// Factory method to get the singleton instance
  factory DetailDestinationRepository() {
    return _repository;
  }

  var apiConstant = HomeApiConstant();

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

  Future<bool> postBookmark(String userId, String destinationId) async {
    try {
      final response = await DioService.dioCall().post(
        '${apiConstant.user}/$userId/${apiConstant.bookmark}',
        data: {
          'user_id': userId,
          'destination_id': destinationId,
          'createdAt': DateTime.now().toString(),
          'updatedAt': DateTime.now().toString(),
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

  Future<bool> removeBookmark(String userId, String bookmarkId) async {
    try {
      final response = await DioService.dioCall().delete(
        '${apiConstant.user}/$userId/${apiConstant.bookmark}/$bookmarkId',
      );

      if (response.statusCode == 200) {
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
