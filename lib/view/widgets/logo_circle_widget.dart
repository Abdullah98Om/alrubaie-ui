import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/constant.dart';

class LogoCircleWidget extends StatelessWidget {
  final double width;
  const LogoCircleWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.w),
        width: width,
        height: width,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: primaryColorShade),
        child: Image.asset(logoLocation));
  }
}
