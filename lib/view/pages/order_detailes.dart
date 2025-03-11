import 'package:alrubaie/controller/order_controller.dart';
import 'package:alrubaie/utility/widget_loader.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utility/constant.dart';
import '../../utility/converter.dart';
import '../widgets/appbar/my_main_appbar.dart';
import '../widgets/my_divider.dart';
import '../widgets/order/customer_info_widget.dart';
import '../widgets/order/items_order.dart';
import '../widgets/order/price_part_widget.dart';
import '../widgets/order/state_order.dart';

class OrderDetailes extends GetView<OrderController> {
  const OrderDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar1(
          title: "تفاصيل الطلب",
          icon: false,
          // newIcon: Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 8.w),
          //   child: InkWell(
          //     onTap: () => controller.deleteAllMyOrdersFromDB(),
          //     child: Icon(Icons.delete, size: 25.sp),
          //   ),
          // )
        ),
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
                  // state order && header info
                  StateOrder(order: controller.selectedOrder!),

                  SizedBox(height: 4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      children: [
                        // customer info
                        FadeInRight(
                            child: CusomerInfoWidget(
                          name: controller.selectedOrder!.name!,
                          location: controller.selectedOrder!.location!,
                          phone: controller.selectedOrder!.phone!,
                        )),
                        const MyDivider(),
                        // items cart
                        FadeInUp(child:
                            GetBuilder<OrderController>(builder: (controller) {
                          return controller.itemsLoader
                              ? const WidgetLoader(
                                  widget: ItemsOrderForDetailes(items: []))
                              : ItemsOrderForDetailes(items: controller.items);
                        })),

                        SizedBox(height: 16.h),

                        // price order part
                        FadeInUp(
                          child: PricePart(
                              finalPrice:
                                  controller.selectedOrder!.finalPrice! > 0
                                      ? convertPrice(
                                          controller.selectedOrder!.finalPrice!)
                                      : "لم يحدد بعد",
                              price: convertPrice(
                                  controller.selectedOrder!.price!),
                              deliveryPrice:
                                  controller.selectedOrder!.finalPrice! > 0
                                      ? convertPrice(controller
                                              .selectedOrder!.finalPrice! -
                                          controller.selectedOrder!.price!)
                                      : "لم يحدد بعد"),
                        ),

                        SizedBox(height: 24.h),

                        controller.selectedOrder!.note != ""
                            ? SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "ملاحظة : ${controller.selectedOrder!.note}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: primaryColorShade,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Text(
                                "لا توجد ملاحظات",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                        SizedBox(height: 16.h),

                        // Button send final order
                        // GetBuilder<OrderController>(builder: (controller) {
                        //   return FadeInUp(
                        //     child: controller.sendLoader
                        //         ? Center(
                        //             child: loader(color: secondryColor),
                        //           )
                        //         : MyButton(
                        //             onTap: () {
                        //               controller.sendFinalOrder();
                        //             },
                        //             title: "أرسال الطلب",
                        //             height: 60.h,
                        //             color: secondryColor),
                        //   );
                        // })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
