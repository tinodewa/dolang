import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeSearchDestinationController extends GetxController {
  static HomeSearchDestinationController get to => Get.find();

  final RxString keyword = ''.obs;
  RxList<DestinationModel> destinationList = <DestinationModel>[].obs;
  RxList<DestinationModel> limitDestinationList = <DestinationModel>[].obs;
  final RxInt pageDestination = 0.obs;
  final RxBool canLoadMoreDestination = true.obs;
  final RefreshController refreshDestinationController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() async {
    destinationList.value = Get.arguments as List<DestinationModel>;
    super.onInit();

    // Check connection
    await GlobalController.to.checkConnection();
    await getListOfDataDestination();
  }

  List<DestinationModel> get filteredDestinationList => limitDestinationList
      .where(
        (element) => element.name
            .toString()
            .toLowerCase()
            .contains(keyword.value.toLowerCase()),
      )
      .toList();

  /// List Destination
  Future<bool> getListOfDataDestination() async {
    try {
      final result = getLimitedDestinationListOfData(
        offset: pageDestination.value * 5,
      );

      if (result['previous'] == null) {
        limitDestinationList.clear();
      }

      if (result['next'] == null) {
        canLoadMoreDestination(false);
        refreshDestinationController.loadNoData();
      }

      limitDestinationList.addAll(result['data']);
      pageDestination.value++;
      refreshDestinationController.loadComplete();

      return true;
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );

      refreshDestinationController.loadFailed();
      return false;
    }
  }

  /// Limit Destination
  Map<String, dynamic> getLimitedDestinationListOfData({int offset = 0}) {
    int limit = 10 + offset;
    if (limit > destinationList.length) limit = destinationList.length;
    if (offset > limit) offset = limit;

    return {
      'data': destinationList.getRange(offset, limit).toList(),
      'next': limit < destinationList.length ? true : null,
      'previous': offset > 0 ? true : null,
    };
  }
}
