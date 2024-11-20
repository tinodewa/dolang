import 'package:dolang/features/sign_in/models/users_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

const String _boxName = "dolang";

class LocalStorageService extends GetxService {
  LocalStorageService._();

  /// Singleton instance
  static final LocalStorageService _repository = LocalStorageService._();

  /// Factory method to get the singleton instance
  factory LocalStorageService() {
    return _repository;
  }

  static final box = Hive.box(_boxName);

  Future<void> init() async {
    await Hive.initFlutter();
  }

  static Future<void> setAuth(UsersModel? usersModel) async {
    await Hive.openBox(_boxName);
    await box.put('isLogin', true);
    await box.put('userId', usersModel!.userId);
    await box.put('username', usersModel.username);
    await box.put('email', usersModel.email);
    await box.put('phoneNumber', usersModel.phoneNumber);
    await box.put('address', usersModel.address);
    await box.put('photoUrl', usersModel.photoUrl);
  }

  static Future<UsersModel?> getLoggedUserData() async {
    await Hive.openBox(_boxName);
    UsersModel? usersModel = UsersModel(
      userId: box.get('userId'),
      username: box.get('username'),
      email: box.get('email'),
      phoneNumber: box.get('phoneNumber'),
      address: box.get('address'),
      photoUrl: box.get('photoUrl'),
    );
    return usersModel;
  }

  static Future<bool?> getAuth() async {
    await Hive.openBox(_boxName);
    final isLogin = await box.get("isLogin");
    return isLogin;
  }

  static Future deleteAuth() async {
    await Hive.openBox(_boxName);
    if (box.get("isLogin") == true) {
      box.clear();
      box.put("isLogin", false);
    } else {
      box.clear();
      box.put("isLogin", false);
    }
  }
}
