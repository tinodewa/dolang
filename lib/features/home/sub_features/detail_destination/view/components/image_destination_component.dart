import 'package:cached_network_image/cached_network_image.dart';
import 'package:dolang/features/home/sub_features/detail_destination/controllers/home_detail_destination_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageDestinationComponent extends StatelessWidget {
  const ImageDestinationComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15.r),
      ),
      child: Container(
        width: 1.sw,
        height: 350.h,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15.r),
          ),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              HomeDetailDestinationController.to.destination?.photo ??
                  'https://javacode.landa.id/img/promo/gambar_62661b52223ff.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
