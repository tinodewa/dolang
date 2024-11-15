import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/features/sign_in/bindings/sign_in_binding.dart';
import 'package:dolang/features/sign_in/view/ui/sign_in_screen.dart';
import 'package:get/get.dart';

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.signInRoute,
      page: () => SignInScreen(),
      binding: SignInBinding(),
    ),
  ];
}
