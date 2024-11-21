import 'package:dolang/features/dashboard/constants/dashboard_assets_constant.dart';
import 'package:dolang/features/home/view/ui/home_screen.dart';
import 'package:dolang/features/profile/view/ui/profile_screen.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final assetsConstant = DashboardAssetsConstant();

  @override
  Widget build(BuildContext context) {
    RxInt currentPageIndex = 0.obs;
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: <Widget>[
            /// Home page
            HomeScreen(),

            /// Book page
            const Card(
              shadowColor: Colors.transparent,
              margin: EdgeInsets.all(8.0),
              child: SizedBox.expand(
                child: Center(
                  child: Text(
                    'Book page',
                  ),
                ),
              ),
            ),

            /// Profile page
            ProfileScreen(),
          ][currentPageIndex.value],
          bottomNavigationBar: NavigationBar(
            height: kBottomNavigationBarHeight,
            onDestinationSelected: (int index) {
              currentPageIndex.value = index;
            },
            backgroundColor: ColorStyle.white,
            indicatorColor: Colors.transparent,
            selectedIndex: currentPageIndex.value,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  color: ColorStyle.primary,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  color: ColorStyle.blackMedium50,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Badge(
                  label: Text('2'),
                  child: Icon(
                    Icons.calendar_month,
                    color: ColorStyle.primary,
                  ),
                ),
                icon: Badge(
                  label: Text('2'),
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: ColorStyle.blackMedium50,
                  ),
                ),
                label: 'Books',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.person,
                  color: ColorStyle.primary,
                ),
                icon: Icon(
                  Icons.person_outline_rounded,
                  color: ColorStyle.blackMedium50,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
