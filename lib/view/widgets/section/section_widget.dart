import 'package:alrubaie/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utility/constant.dart';

class SectionWidget extends GetView<HomeController> {
  final String title;
  final bool selected;
  final int index;
  final bool superSection;
  const SectionWidget(
      {super.key,
      required this.superSection,
      required this.title,
      required this.selected,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (superSection) {
          controller.changeSelectedSuperSection(index);
        } else {
          controller.changeSelectedSection(index);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.h, bottom: 5.h, right: 1.w, left: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: selected ? primaryColor : backgroundColor,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: selected ? [productShadow] : [],
            border: Border.all(color: primaryColor, width: selected ? 0 : 2)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: selected ? backgroundColor : primaryColor),
        )),
      ),
    );
  }
}
