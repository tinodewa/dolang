import 'package:cached_network_image/cached_network_image.dart';
import 'package:dolang/configs/routes/route.dart';
import 'package:dolang/features/home/models/destination_model.dart';
import 'package:dolang/features/home/view/components/item_card_information_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemCardComponent extends StatelessWidget {
  const ItemCardComponent({
    super.key,
    required this.destination,
  });

  final DestinationModel destination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.homeDetailDestinationRoute,
          arguments: destination,
        );
      },
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        width: 1.sw,
        height: 230.h,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15.r),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              destination.photo ??
                  'https://javacode.landa.id/img/promo/gambar_62661b52223ff.png',
            ),
            fit: BoxFit.fill,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(115, 71, 70, 70),
              offset: Offset(0, 2),
              blurRadius: 8,
            ),
          ],
        ),
        child: ItemCardInformationComponent(destination: destination),
      ),
    );
  }
}
