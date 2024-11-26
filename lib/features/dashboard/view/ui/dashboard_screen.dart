import 'package:dolang/features/book_list/view/ui/book_list_screen.dart';
import 'package:dolang/features/dashboard/constants/dashboard_assets_constant.dart';
import 'package:dolang/features/dashboard/view/components/bottom_navbar_dashboard_component.dart';
import 'package:dolang/features/home/view/ui/home_screen.dart';
import 'package:dolang/features/profile/view/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final assetsConstant = DashboardAssetsConstant();

  @override
  Widget build(BuildContext context) {
    RxInt currentPageIndex = 2.obs;
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: <Widget>[
            /// Home page
            HomeScreen(),

            /// Book page
            BookListScreen(),

            /// Profile page
            ProfileScreen(),
          ][currentPageIndex.value],
          bottomNavigationBar: BottomNavbarDashboardComponent(
            currentPageIndex: currentPageIndex,
          ),
        ),
      ),
    );
  }
}
