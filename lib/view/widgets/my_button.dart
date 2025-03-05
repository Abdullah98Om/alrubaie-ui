import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/constant.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double height;
  final Color color;
  final bool outline;

  const MyButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.height = 35,
      this.outline = false,
      this.color = primaryColorShade});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: height.h,
        decoration: BoxDecoration(
            border: Border.all(
                color: outline ? color : Colors.transparent,
                width: outline ? 3 : 0),
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: outline ? [] : [buttonShadow],
            color: outline ? Colors.white : color),
        child: Text(
          title,
          style: TextStyle(
              color: outline ? color : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
