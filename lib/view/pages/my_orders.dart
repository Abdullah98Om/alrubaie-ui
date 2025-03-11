import 'package:alrubaie/controller/order_controller.dart';
import 'package:alrubaie/view/widgets/appbar/my_main_appbar.dart';
import 'package:alrubaie/view/widgets/empty_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utility/loader.dart';
import '../widgets/order/order_card.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.find<OrderController>();
    return Scaffold(
      appBar: myAppBar1(
          title: "طلباتي",
          icon: false,
          newIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: InkWell(
              onTap: () => controller.deleteAllMyOrdersFromDB(),
              child: Icon(Icons.delete, size: 25.sp),
            ),
          )),
      body: GetBuilder<OrderController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
          child: controller.myOrders.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.myOrders.length,
                  itemBuilder: (context, index) {
                    return OrderCard(index: index);
                  },
                )
              : controller.getAllMyOrdersLoader
                  ? loader()
                  : const Center(child: EmptyText(txt: "لا توجد طلبات ..")),
        );
      }),
    );
  }
}
