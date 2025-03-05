import 'package:alrubaie/utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyBackIcon extends StatelessWidget {
  final Color color;
  const MyBackIcon({super.key, this.color = primaryColorShade});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 40.h,
        right: 25.w,
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            size: 30.sp,
            color: color,
          ),
        ));
  }
}
