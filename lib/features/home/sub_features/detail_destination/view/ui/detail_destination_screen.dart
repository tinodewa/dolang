import 'package:cached_network_image/cached_network_image.dart';
import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/features/home/constants/home_assets_constant.dart';
import 'package:dolang/features/home/sub_features/detail_destination/controllers/home_detail_destination_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:dolang/shared/widgets/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class DetailDestinationScreen extends StatelessWidget {
  DetailDestinationScreen({super.key});

  final assetsConstant = HomeAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ConditionalSwitch.single(
        context: context,
        valueBuilder: (context) =>
            HomeDetailDestinationController.to.detailDestinationState.value,
        caseBuilders: {
          'error': (context) => const ErrorScreen(
                message: 'Error loading detail destination!',
              ),
          'success': (context) => Scaffold(
                extendBody: true,
                backgroundColor: ColorStyle.white,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Padding(
                    padding: EdgeInsets.all(13.r),
                    child: CircleAvatar(
                      radius: 30.r,
                      backgroundColor: ColorStyle.secondary,
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.r),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: ColorStyle.blackDark,
                            size: 20.sp,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    SizedBox(
                      width: 45.w,
                      height: 45.h,
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundColor: ColorStyle.secondary,
                        child: Obx(
                          () => IconButton(
                            icon: Icon(
                              HomeDetailDestinationController
                                      .to.isBookmark.value
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: ColorStyle.blackDark,
                              size: 21.sp,
                            ),
                            onPressed: () {
                              HomeDetailDestinationController
                                      .to.isBookmark.value
                                  ? HomeDetailDestinationController.to
                                      .removeBookmark()
                                  : HomeDetailDestinationController.to
                                      .addBookmark();
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(15.r),
                        child: Container(
                          width: 1.sw,
                          height: 350.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15.r),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                HomeDetailDestinationController
                                        .to.destination?.photo ??
                                    'https://javacode.landa.id/img/promo/gambar_62661b52223ff.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20.r,
                          left: 20.r,
                          right: 20.r,
                          bottom: kBottomNavigationBarHeight + 20.r,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    HomeDetailDestinationController
                                            .to.destination?.name ??
                                        '',
                                    style: GoogleTextStyle.fw500.copyWith(
                                      fontSize: 18.sp,
                                      color: ColorStyle.blackDark,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      HomeDetailDestinationController
                                              .to.destination?.pricePerPerson ??
                                          '',
                                      style: GoogleTextStyle.fw500.copyWith(
                                        fontSize: 18.sp,
                                        color: ColorStyle.blackMedium,
                                      ),
                                    ),
                                    Text(
                                      '/orang',
                                      style: GoogleTextStyle.fw400.copyWith(
                                        fontSize: 15.sp,
                                        color: ColorStyle.blackMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 17.r,
                                  color: ColorStyle.greyMedium,
                                ),
                                Text(
                                  HomeDetailDestinationController
                                          .to.destination?.location ??
                                      '',
                                  style: GoogleTextStyle.fw400.copyWith(
                                    fontSize: 14.sp,
                                    color: ColorStyle.greyDark,
                                  ),
                                ),
                                SizedBox(width: 7.w),
                                Text(
                                  '|',
                                  style: GoogleTextStyle.fw400.copyWith(
                                    fontSize: 14.sp,
                                    color: ColorStyle.greyMedium,
                                  ),
                                ),
                                SizedBox(width: 7.w),
                                Icon(
                                  Icons.my_location_sharp,
                                  size: 17.r,
                                  color: ColorStyle.greyDark,
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  '14km',
                                  style: GoogleTextStyle.fw400.copyWith(
                                    fontSize: 14.sp,
                                    color: ColorStyle.greyDark,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: ColorStyle.white,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(30.r),
                                  top: Radius.circular(30.r),
                                ),
                                border: Border.all(
                                  color: ColorStyle.greyDark50,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 1.sw * 0.41,
                                    height: 40.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorStyle.greyLight,
                                      borderRadius: BorderRadius.circular(
                                        30.r,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.people,
                                          color: ColorStyle.complementary,
                                          size: 22.r,
                                        ),
                                        SizedBox(width: 6.h),
                                        Text(
                                          'Max 12 Grup Size',
                                          style: GoogleTextStyle.fw500.copyWith(
                                            fontSize: 12.sp,
                                            color: ColorStyle.blackMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.5.w,
                                    child: Container(
                                      height: 25.h,
                                      color: ColorStyle.greyDark50,
                                    ),
                                  ),
                                  Container(
                                    width: 1.sw * 0.41,
                                    height: 40.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorStyle.greyLight,
                                      borderRadius: BorderRadius.circular(
                                        30.r,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.timelapse_rounded,
                                          color: ColorStyle.complementary,
                                          size: 22.r,
                                        ),
                                        SizedBox(width: 6.h),
                                        Text(
                                          '4 Day Trip Duration',
                                          style: GoogleTextStyle.fw500.copyWith(
                                            fontSize: 12.sp,
                                            color: ColorStyle.blackMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              'Description',
                              style: GoogleTextStyle.fw600.copyWith(
                                fontSize: 20.sp,
                                color: ColorStyle.blackMedium,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                              style: GoogleTextStyle.fw400.copyWith(
                                fontSize: 14.sp,
                                color: ColorStyle.blackMedium,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Location',
                                  style: GoogleTextStyle.fw600.copyWith(
                                    fontSize: 20.sp,
                                    color: ColorStyle.blackMedium,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    HomeDetailDestinationController.to
                                        .openOnMaps();
                                  },
                                  child: Text(
                                    'Open on maps >',
                                    style: GoogleTextStyle.fw500.copyWith(
                                      fontSize: 14.sp,
                                      color: ColorStyle.complementary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Container(
                              width: 1.sw,
                              height: 340.h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: FlutterMap(
                                options: MapOptions(
                                  initialCenter: LatLng(
                                    double.parse(
                                      HomeDetailDestinationController
                                          .to.destination!.latitude!
                                          .toString(),
                                    ),
                                    double.parse(
                                      HomeDetailDestinationController
                                          .to.destination!.longitude!
                                          .toString(),
                                    ),
                                  ),
                                  initialZoom: 15,
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    userAgentPackageName: 'com.example.app',
                                  ),
                                  MarkerLayer(
                                    markers: [
                                      Marker(
                                        point: LatLng(
                                          double.parse(
                                            HomeDetailDestinationController
                                                .to.destination!.latitude!
                                                .toString(),
                                          ),
                                          double.parse(
                                            HomeDetailDestinationController
                                                .to.destination!.longitude!
                                                .toString(),
                                          ),
                                        ),
                                        width: 120,
                                        height: 120,
                                        child: const Icon(
                                          Icons.location_on,
                                          color: ColorStyle.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: Container(
                  width: double.infinity,
                  height: kBottomNavigationBarHeight,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.r,
                      right: 20.r,
                      bottom: 20.r,
                    ),
                    child: TextButton(
                      onPressed: () {
                        try {
                          Get.toNamed(
                            Routes.bookingRoute,
                            arguments:
                                HomeDetailDestinationController.to.destination,
                          );
                        } catch (exception, stackTrace) {
                          Sentry.captureException(
                            exception,
                            stackTrace: stackTrace,
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: ColorStyle.primaryLight,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: const BorderSide(
                            color: ColorStyle.primaryLight,
                            width: 1.5,
                          ),
                        ),
                        shadowColor: ColorStyle.primary,
                        elevation: 3,
                      ),
                      child: Text(
                        'Booking',
                        style: GoogleTextStyle.fw700.copyWith(
                          fontSize: 14.0,
                          color: ColorStyle.blackMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
        },
      ),
    );
  }
}
