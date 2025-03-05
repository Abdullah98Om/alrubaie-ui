import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../utility/constant.dart';
import '../../../utility/loader.dart';

class SectionXLWidget extends GetView<HomeController> {
  final int index;
  const SectionXLWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeSelectedSuperSection(index);
      },
      child: Stack(
        children: [
          Container(
            // margin: EdgeInsets.symmetric(
            //     vertical: MediaQuery.sizeOf(context).height.h * 0.01),
            height: MediaQuery.sizeOf(context).height.h * 0.23,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [productShadow],
                // border: Border.all(
                //     color: primaryColorShade),
                borderRadius: BorderRadius.circular(15.r)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  placeholder: (context, url) => loader(),
                  errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: primaryColor,
                      ),
                  imageUrl: controller.superSections[index].img!),
            ),
          ),
          Container(
            // margin: EdgeInsets.symmetric(
            //     vertical: MediaQuery.sizeOf(context).height.h * 0.01),
            height: MediaQuery.sizeOf(context).height.h * 0.23,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [primaryColor.withOpacity(0.9), Colors.transparent],
                    begin: const Alignment(0.5, 1.5),
                    end: const Alignment(0, -1.6)),
                borderRadius: BorderRadius.circular(15.r)),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  controller.superSections[index].name!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
