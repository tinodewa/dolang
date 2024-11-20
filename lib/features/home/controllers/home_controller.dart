import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/features/home/repositories/home_repository.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  RxList<DestinationModel> destinationList = <DestinationModel>[].obs;
  RxString destinationState = 'loading'.obs;

  /// Repository
  HomeRepository repository = HomeRepository();

  @override
  void onInit() async {
    super.onInit();

    // Check connection
    await GlobalController.to.checkConnection();
    await getDestination();
  }

  Future<bool> getDestination() async {
    destinationState('loading');

    try {
      List<DestinationModel>? list = await repository.getDestination();
      if (list != null) {
        destinationList.assignAll(list);
        destinationState('success');
        return true;
      } else {
        destinationState('error');
        return false;
      }
    } catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      destinationState('error');
      return false;
    }
  }
}