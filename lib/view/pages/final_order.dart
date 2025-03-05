import 'package:alrubaie/controller/order_controller.dart';
import 'package:alrubaie/utility/converter.dart';
import 'package:alrubaie/utility/loader.dart';
import 'package:alrubaie/view/widgets/my_button.dart';
import 'package:alrubaie/view/widgets/order/price_part_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utility/constant.dart';
import '../widgets/appbar/my_main_appbar.dart';
import '../widgets/my_divider.dart';
import '../widgets/order/customer_info_widget.dart';
import '../widgets/order/items_order.dart';

class FinalOrder extends GetView<OrderController> {
  const FinalOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: myAppBar1(title: "تفاصيل الطلب", icon: false),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: primaryColor.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [productShadow]),
            child: Column(
              children: [
                // header info && state order
                FadeInLeft(
                  child: ListTile(
                    leading: Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                          color: primaryColorShade,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 25.sp,
                      ),
                    ),
                    title: Text(
                      controller.nameTextEditingController.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                          color: secondryColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      convertDate(
                          timestamp: Timestamp.fromDate(DateTime.now())),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                          color: greyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "مكتمل",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      // customer info
                      FadeInRight(
                          child: CusomerInfoWidget(
                        name: controller.nameTextEditingController.text,
                        location: controller.locationTextEditingController.text,
                        phone: controller.phoneTextEditingController.text,
                      )),
                      const MyDivider(),
                      // items cart
                      FadeInUp(
                          child: ItemsOrder(
                              items: controller.cartController.allMyItemsCart)),

                      // price order part
                      FadeInUp(
                        child: PricePart(
                            finalPrice: "لم يحدد بعد",
                            price: convertPrice(
                                controller.cartController.getPriceCart()),
                            deliveryPrice: "لم يحدد بعد"),
                      ),

                      SizedBox(height: 24.h),

                      // Button send final order
                      GetBuilder<OrderController>(builder: (controller) {
                        return FadeInUp(
                          child: controller.sendLoader
                              ? Center(
                                  child: loader(color: secondryColor),
                                )
                              : MyButton(
                                  onTap: () {
                                    controller.sendFinalOrder();
                                  },
                                  title: "أرسال الطلب",
                                  height: 60.h,
                                  color: secondryColor),
                        );
                      }),
                      SizedBox(height: 8.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
