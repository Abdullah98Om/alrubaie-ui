import 'package:alrubaie/controller/cart_controller.dart';
import 'package:alrubaie/utility/constant.dart';
import 'package:alrubaie/view/widgets/appbar/my_main_appbar.dart';
import 'package:alrubaie/view/widgets/empty_text_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/cart/buttom_cart_widget.dart';
import '../widgets/cart/item_cart_widget.dart';

class Cart extends GetView<CartController> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar1(
          title: "السلة",
          icon: false,
          newIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: InkWell(
              onTap: () => controller.clearCart(),
              child: Icon(Icons.delete, size: 25.sp),
            ),
          )),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            // cart items
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: pagePadding,
                        right: pagePadding,
                        left: pagePadding),
                    child: GetBuilder<CartController>(builder: (controller) {
                      return controller.allMyItemsCart.isNotEmpty
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.allMyItemsCart.length,
                              itemBuilder: (context, index) {
                                return FadeInRight(
                                    from: (index * 70) + 50,
                                    child: ItemCartWidget(index: index));
                              })
                          : SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              child: const Center(
                                child: EmptyText(txt: "السلة فارغة"),
                              ),
                            );
                    }),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.18)
                ],
              ),
            ),

            // totle price
            const ButtomCartWidget()
          ],
        ),
      ),
    );
  }
}
