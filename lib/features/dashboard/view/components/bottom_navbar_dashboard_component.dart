import 'package:dolang/features/book_list/controllers/book_list_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbarDashboardComponent extends StatelessWidget {
  const BottomNavbarDashboardComponent({
    super.key,
    required this.currentPageIndex,
  });

  final RxInt currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: kBottomNavigationBarHeight,
      onDestinationSelected: (int index) {
        currentPageIndex.value = index;
      },
      backgroundColor: ColorStyle.white,
      indicatorColor: Colors.transparent,
      selectedIndex: currentPageIndex.value,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: <Widget>[
        const NavigationDestination(
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
        Obx(
          () => BookListController.to.bookListPending.isNotEmpty
              ? NavigationDestination(
                  selectedIcon: Badge(
                    label: Text(
                      BookListController.to.bookListPending.length.toString(),
                    ),
                    child: const Icon(
                      Icons.calendar_month,
                      color: ColorStyle.primary,
                    ),
                  ),
                  icon: Badge(
                    label: Text(
                      BookListController.to.bookListPending.length.toString(),
                    ),
                    child: const Icon(
                      Icons.calendar_month_outlined,
                      color: ColorStyle.blackMedium50,
                    ),
                  ),
                  label: 'Books',
                )
              : const NavigationDestination(
                  selectedIcon: Icon(
                    Icons.calendar_month,
                    color: ColorStyle.primary,
                  ),
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    color: ColorStyle.blackMedium50,
                  ),
                  label: 'Books',
                ),
        ),
        const NavigationDestination(
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
    );
  }
}
