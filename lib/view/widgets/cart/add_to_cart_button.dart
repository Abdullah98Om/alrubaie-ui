import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../my_button.dart';

class AddToCartButton extends GetView<CartController> {
  final String productID;
  final int height;
  const AddToCartButton({super.key, required this.productID, this.height = 60});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: MyButton(
          onTap: () {
            controller.createNewItemCart(productID);
          },
          title: "أضافة للسلة",
          height: height.h),
    );
  }
}
