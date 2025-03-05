import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../utility/constant.dart';

class IncDecToCartWidget extends GetView<CartController> {
  const IncDecToCartWidget(
      {super.key,
      required this.index,
      required this.count,
      this.cartPage = true});

  final int index;
  final int count;
  final bool cartPage;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // incremnet
      InkWell(
        onTap: () {
          controller.updateItemCart(index, true);
        },
        child: Container(
          height: cartPage ? 35.w : 25.w,
          width: cartPage ? 35.w : 25.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  color: primaryColorShade.withOpacity(0.8), width: 2),
              shape: BoxShape.circle),
          child: Center(
            child: Icon(Icons.add,
                size: cartPage ? 26.sp : 20.sp, color: primaryColorShade),
          ),
        ),
      ),
      SizedBox(width: 12.w),
      // count
      Text("$count",
          maxLines: 1,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: primaryColorShade,
              fontWeight: FontWeight.bold,
              fontFamily: fontRoboto,
              fontSize: 18.sp)),
      SizedBox(width: 12.w),

      // decremant
      InkWell(
        onTap: () {
          controller.updateItemCart(index, false);
        },
        child: Container(
          height: cartPage ? 35.w : 25.w,
          width: cartPage ? 35.w : 25.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  color: primaryColorShade.withOpacity(0.8), width: 2),
              shape: BoxShape.circle),
          child: Center(
              child: Icon(Icons.remove,
                  size: cartPage ? 26.sp : 20.sp, color: primaryColorShade)),
        ),
      ),
    ]);
  }
}

class IncDecToCartSmallWidget extends GetView<CartController> {
  const IncDecToCartSmallWidget(
      {super.key, required this.index, required this.count});

  final int index;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // incremnet
      InkWell(
        onTap: () {
          controller.updateItemCart(index, true);
        },
        child: Container(
          height: 30.w,
          width: 30.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  color: primaryColorShade.withOpacity(0.8), width: 2),
              shape: BoxShape.circle),
          child: Center(
            child: Icon(Icons.add, size: 20.sp, color: primaryColorShade),
          ),
        ),
      ),
      SizedBox(width: 12.w),
      // count
      Text("$count",
          maxLines: 1,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: primaryColorShade,
              fontWeight: FontWeight.bold,
              fontFamily: fontRoboto,
              fontSize: 18.sp)),
      SizedBox(width: 12.w),

      // decremant
      InkWell(
        onTap: () {
          controller.updateItemCart(index, false);
        },
        child: Container(
          height: 30.w,
          width: 30.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  color: primaryColorShade.withOpacity(0.8), width: 2),
              shape: BoxShape.circle),
          child: Center(
              child: Icon(Icons.remove, size: 20.sp, color: primaryColorShade)),
        ),
      ),
    ]);
  }
}
