import 'package:alrubaie/controller/home_controller.dart';
import 'package:alrubaie/utility/converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utility/constant.dart';
import '../cart/add_to_cart_button.dart';

class ButtomDetaileProductWidget extends GetView<HomeController> {
  const ButtomDetaileProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.14,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(horizontal: pagePadding),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          // add to cart button
          AddToCartButton(productID: controller.selectedProduct!.id!),

          // price product
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //befor discount product price
                controller.selectedProduct!.discount! > 0
                    ? Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                            convertPrice(controller.selectedProduct!.price!),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: greyColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: primaryColorShade,
                                fontFamily: fontRoboto,
                                fontSize: 18.sp)),
                      )
                    : const SizedBox.shrink(),
                //   product price
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                      convertPrice(controller.selectedProduct!.getPrice()),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontRoboto,
                          fontSize: 26.sp)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
