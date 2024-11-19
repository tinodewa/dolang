import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/features/dashboard/bindings/dashboard_binding.dart';
import 'package:dolang/features/dashboard/view/ui/dashboard_screen.dart';
import 'package:dolang/features/home/bindings/home_binding.dart';
import 'package:dolang/features/home/view/ui/home_screen.dart';
import 'package:dolang/features/profile/bindings/profile_binding.dart';
import 'package:dolang/features/profile/view/ui/profile_screen.dart';
import 'package:dolang/features/sign_in/bindings/sign_in_binding.dart';
import 'package:dolang/features/sign_in/view/ui/sign_in_screen.dart';
import 'package:dolang/features/sign_up/bindings/sign_up_binding.dart';
import 'package:dolang/features/sign_up/view/ui/sign_up_screen.dart';
import 'package:dolang/features/splash/bindings/splash_binding.dart';
import 'package:dolang/features/splash/view/ui/splash_screen.dart';
import 'package:get/get.dart';

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.signInRoute,
      page: () => SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.signUpRoute,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.dashboardRoute,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.homeRoute,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.profileRoute,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
