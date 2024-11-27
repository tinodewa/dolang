import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/features/book_list/bindings/book_list_binding.dart';
import 'package:dolang/features/book_list/sub_features/detail_book/view/ui/detail_book_screen.dart';
import 'package:dolang/features/book_list/view/ui/book_list_screen.dart';
import 'package:dolang/features/booking/bindings/booking_binding.dart';
import 'package:dolang/features/booking/view/ui/booking_screen.dart';
import 'package:dolang/features/dashboard/bindings/dashboard_binding.dart';
import 'package:dolang/features/dashboard/view/ui/dashboard_screen.dart';
import 'package:dolang/features/home/bindings/home_binding.dart';
import 'package:dolang/features/home/sub_features/detail_destination/view/ui/detail_destination_screen.dart';
import 'package:dolang/features/home/view/ui/home_screen.dart';
import 'package:dolang/features/profile/bindings/profile_binding.dart';
import 'package:dolang/features/profile/sub_features/bookmark/view/ui/bookmark_screen.dart';
import 'package:dolang/features/profile/sub_features/personal_information/view/ui/personal_information_screen.dart';
import 'package:dolang/features/profile/sub_features/privacy_policy/view/ui/privacy_policy_screen.dart';
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
      name: Routes.homeDetailDestinationRoute,
      page: () => DetailDestinationScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.bookListRoute,
      page: () => BookListScreen(),
      binding: BookListBinding(),
    ),
    GetPage(
      name: Routes.bookListDetailBookRoute,
      page: () => DetailBookScreen(),
      binding: BookListBinding(),
    ),
    GetPage(
      name: Routes.bookingRoute,
      page: () => BookingScreen(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: Routes.profileRoute,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.profilePersonalInformationRoute,
      page: () => PersonalInformationScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.bookmarkRoute,
      page: () => BookmarkScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.profilePrivacyPolicyRoute,
      page: () => PrivacyPolicyScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
