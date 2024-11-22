import 'package:dolang/features/home/sub_features/detail_destination/controllers/home_detail_destination_controller.dart';
import 'package:dolang/shared/styles/color_style.dart';
import 'package:dolang/shared/styles/google_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class MapDestinationComponent extends StatelessWidget {
  const MapDestinationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                HomeDetailDestinationController.to.openOnMaps();
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
                  HomeDetailDestinationController.to.destination!.latitude!
                      .toString(),
                ),
                double.parse(
                  HomeDetailDestinationController.to.destination!.longitude!
                      .toString(),
                ),
              ),
              initialZoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
    );
  }
}
