import 'package:alrubaie/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utility/constant.dart';

class AddToCartIcon extends GetView<CartController> {
  final String productID;
  const AddToCartIcon({super.key, required this.productID});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.createNewItemCart(productID);
      },
      child: ClipOval(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(7.w),
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: [buttonShadow],
              color: primaryColorShade),
          child: Image.asset(cartIcon),
        ),
      ),
    );
  }
}
