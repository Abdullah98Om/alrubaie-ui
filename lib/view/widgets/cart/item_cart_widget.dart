import 'package:alrubaie/controller/cart_controller.dart';
import 'package:alrubaie/model/product_model.dart';
import 'package:alrubaie/view/widgets/cart/inc_dec_to_cart_widget.dart';
import 'package:alrubaie/view/widgets/product/star_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utility/constant.dart';
import '../../../utility/loader.dart';
import '../my_divider.dart';
import '../product/product_price_widget.dart';
import '../product/product_title.dart';
import '../product/section_name_widget.dart';

class ItemCartWidget extends GetView<CartController> {
  final int index;
  const ItemCartWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // cart item
        Builder(builder: (context) {
          ProductModel product = controller.allMyItemsCart[index].product!;
          int count = controller.allMyItemsCart[index].count!;
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                // product image
                Stack(
                  children: [
                    Container(
                        height: MediaQuery.sizeOf(context).height * 0.21,
                        width: MediaQuery.sizeOf(context).width * 0.32,
                        margin:
                            EdgeInsets.only(top: 8.h, bottom: 8.h, left: 12.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.white,
                            boxShadow: [productShadow]),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: controller
                                        .allMyItemsCart[index].product!.img !=
                                    null
                                ? CachedNetworkImage(
                                    imageUrl: controller
                                        .allMyItemsCart[index].product!.img!,
                                    errorWidget: (context, url, error) => Icon(
                                        Icons.error,
                                        color: primaryColor,
                                        size: 30.sp),
                                    placeholder: (context, url) => loader(),
                                    fit: BoxFit.contain)
                                : Image.asset(logoLocation,
                                    fit: BoxFit.contain))),
                    const StarIcon(left: 15, top: 15)
                  ],
                ),

                // cart item info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      // product Name
                      ProductTitle(
                          title: "${product.name}", maxLines: 1, fontSize: 20),
                      SizedBox(height: 4.h),

                      // section Name
                      SectionNameWidget(
                          fontSize: 12, name: "${product.section!.name}"),

                      SizedBox(height: 8.h),
                      // price
                      ProductPriceWidget(
                          price: controller.getItemPrice(product, count)),
                      SizedBox(height: 8.h),
                      IncDecToCartWidget(index: index, count: count),
                      SizedBox(height: 16.h)
                    ],
                  ),
                )
              ],
            ),
          );
        }),
        // SizedBox(height: 4.h),
        const MyDivider()
      ],
    );
  }
}
