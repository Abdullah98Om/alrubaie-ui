import 'package:alrubaie/controller/cart_controller.dart';
import 'package:alrubaie/utility/converter.dart';
import 'package:alrubaie/utility/router/page_route.dart';
import 'package:alrubaie/view/widgets/my_button.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utility/constant.dart';

class ButtomCartWidget extends StatelessWidget {
  const ButtomCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        // height: MediaQuery.sizeOf(context).height * 0.21,
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        decoration: BoxDecoration(
            color: primaryColor,
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r))),
        child: Center(
          child: FadeInUp(
            child: GetBuilder<CartController>(builder: (controller) {
              return Column(
                children: [
                  // SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        child: Text("تكلفة السلة",
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: primaryColorShade,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp)),
                      ),
                      Expanded(
                        child: Text(convertPrice(controller.getPriceCart()),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: primaryColorShade,
                                fontWeight: FontWeight.bold,
                                // fontFamily: fontRoboto,
                                fontSize: 24.sp)),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                  if (controller.allMyItemsCart.isNotEmpty)
                    MyButton(
                        onTap: () {
                          Get.toNamed("/${MyPages.shaippingOrder}");
                        },
                        height: 60.h,
                        title: "أكمال الطلب",
                        color: secondryColor),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
