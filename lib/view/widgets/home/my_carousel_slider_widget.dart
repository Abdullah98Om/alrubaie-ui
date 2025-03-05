import 'package:alrubaie/utility/widget_loader.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/slider_controller.dart';
import '../../../utility/constant.dart';
import '../../../utility/loader.dart';

class MyCarouselSliderWidget extends StatelessWidget {
  const MyCarouselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderController>(builder: (controller) {
      return Column(
        children: [
          controller.allCursal.isNotEmpty
              ? FadeInRight(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      // enlargeCenterPage: true,
                      aspectRatio: 16 / 9, // نسبة الطول للعرض
                      initialPage: 0,
                      autoPlayInterval: const Duration(seconds: 10),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlay: true,
                      reverse: true,
                      height: MediaQuery.of(context).size.height * 0.22,
                      onPageChanged: (index, reason) {
                        controller.selectedIndex = index;
                        controller.update();
                      },
                    ),
                    items: controller.allCursal
                        .map(
                          (i) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            width: MediaQuery.of(context).size.width.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: primaryColor,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: CachedNetworkImage(
                                imageUrl: i,
                                // height: MediaQuery.of(context).size.height.h * 0.2,
                                // width: MediaQuery.of(context).size.width.w * 0.9,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    loader(color: Colors.white),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error,
                                        color: primaryColor),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              : controller.allCursalLoader
                  ? WidgetLoader(
                      // ignore: sized_box_for_whitespace
                      widget: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.sizeOf(context).width.w,
                      child: const Icon(Icons.image),
                    ))
                  : const SizedBox.shrink(),
          // dots
          if (controller.allCursal.isNotEmpty || controller.allCursalLoader)
            SizedBox(height: 16.h),
          controller.allCursal.isNotEmpty
              ? FadeInRight(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width.w * 0.9,
                    child: Center(
                      child: Wrap(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < controller.allCursal.length; i++)
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 6.w,
                              width: controller.selectedIndex == i ? 30.w : 6.w,
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex == i
                                      ? primaryColor
                                      : greyColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                            )
                        ],
                      ),
                    ),
                  ),
                )
              : controller.allCursalLoader
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 8.w,
                          width: 60.w,
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(10.r)),
                        )
                      ],
                    )
                  : SizedBox.shrink(),
        ],
      );
    });
  }
}
