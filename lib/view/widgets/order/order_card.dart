import 'package:alrubaie/view/widgets/order/customer_info_widget.dart';
import 'package:alrubaie/view/widgets/order/state_order.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/order_controller.dart';
import '../../../utility/constant.dart';
import '../../../utility/converter.dart';
import '../my_button.dart';
import '../my_divider.dart';

class OrderCard extends GetView<OrderController> {
  final int index;
  const OrderCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.sizeOf(context).height * 0.4,
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: primaryColor.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [productShadow]),
      child: Column(
        children: [
          // header info && state order
          StateOrder(order: controller.myOrders[index]),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                // customer info
                FadeInRight(
                    child: CusomerInfoWidget(
                  name: controller.myOrders[index].name!,
                  location: controller.myOrders[index].location!,
                  phone: controller.myOrders[index].phone!,
                )),

                const MyDivider(),

                SizedBox(height: 16.h),
                FadeInUp(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Button send final order
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.33,
                        child: MyButton(
                            onTap: () {
                              controller.showOrderDetaile(index);
                            },
                            // outline: true,
                            title: "عرض الطلب",
                            height: 50.h,
                            color: primaryColor),
                      ),
                      Expanded(
                        child: Text(
                          convertPrice(
                              controller.myOrders[index].finalPrice! > 0
                                  ? controller.myOrders[index].finalPrice!
                                  : controller.myOrders[index].price!),
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.ltr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                              color: secondryColor,
                              fontSize: 22.sp,
                              fontFamily: fontRoboto,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
