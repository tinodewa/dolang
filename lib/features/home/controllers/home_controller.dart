import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/features/home/repositories/home_repository.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  RxList<DestinationModel> destinationList = <DestinationModel>[].obs;

  /// Repository
  HomeRepository repository = HomeRepository();

  @override
  void onInit() async {
    super.onInit();

    // Check connection
    await GlobalController.to.checkConnection();
    await getDestination();
  }

  Future<void> getDestination() async {
    List<DestinationModel>? list = await repository.getDestination();
    if (list != null) {
      destinationList.assignAll(list);
    }
  }
}
