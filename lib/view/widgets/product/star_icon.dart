import 'package:alrubaie/view/widgets/product/star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarIcon extends StatelessWidget {
  final int top, left;
  const StarIcon({super.key, this.top = 10, this.left = 10});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top.h,
      left: left.w,
      child: const Star(),
    );
  }
}
