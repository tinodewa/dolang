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

  static Future<void> setAuth() async {
    await Hive.openBox(_boxName);
    await box.put('isLogin', true);
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
