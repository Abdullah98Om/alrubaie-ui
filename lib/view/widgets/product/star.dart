import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utility/constant.dart';

class Star extends StatelessWidget {
  const Star({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
          width: 25.w,
          height: 25.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: color3, boxShadow: [productShadow]),
          child: Icon(
            Icons.star,
            color: primaryColorShade,
            size: 20.sp,
          )),
    );
  }
}
