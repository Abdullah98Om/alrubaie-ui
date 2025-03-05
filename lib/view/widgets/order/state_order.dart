import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/order_controller.dart';
import '../../../model/order_model.dart';
import '../../../utility/constant.dart';
import '../../../utility/converter.dart';

class StateOrder extends GetView<OrderController> {
  final OrderModel order;
  const StateOrder({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
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
          order.name!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: TextStyle(
              color: secondryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          convertDateTime(dateTime: order.createdDate!),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: TextStyle(
              color: greyColor, fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        trailing: Builder(builder: (context) {
          String state = controller.getStateOrder(order);

          return Text(
            state,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
                color: state == "مرفوض" ? secondryColor : primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          );
        }),
      ),
    );
  }
}
