import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utility/router/page_route.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/${MyPages.cart}");
      },
      child: SizedBox(
        width: 40.w,
        height: 40.h,
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
          size: 30.sp,
        ),
      ),
    );
  }
}
