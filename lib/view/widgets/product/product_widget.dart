import 'package:alrubaie/controller/cart_controller.dart';
import 'package:alrubaie/controller/home_controller.dart';
import 'package:alrubaie/model/product_model.dart';
import 'package:alrubaie/utility/converter.dart';
import 'package:alrubaie/view/widgets/cart/inc_dec_to_cart_widget.dart';
import 'package:alrubaie/view/widgets/product/product_price_widget.dart';
import 'package:alrubaie/view/widgets/product/star_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utility/constant.dart';
import '../../../utility/loader.dart';
import '../../../utility/router/page_route.dart';
import '../cart/add_to_cart_button.dart';

class ProductWidget extends GetView<HomeController> {
  final bool xlProduct;
  final ProductModel product;
  const ProductWidget(
      {super.key, this.xlProduct = false, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selectedProduct = product;
        Get.toNamed("/${MyPages.productDetaile}");
      },
      child: Container(
        width: xlProduct
            ? MediaQuery.sizeOf(context).width * 0.45
            : MediaQuery.sizeOf(context).width * 0.4,
        margin: EdgeInsets.only(left: xlProduct ? 0 : 8.w),
        // padding: EdgeInsets.all(5),
        child: Column(
          children: [
            // product image
            Stack(
              children: [
                // img
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.21,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [productShadow]),
                  child: product.img != null
                      ? ClipRRect(
                          borderRadius:
                              BorderRadius.circular(xlProduct ? 15.r : 0),
                          child: CachedNetworkImage(
                              imageUrl: product.img!,
                              placeholder: (context, url) => loader(),
                              fit: BoxFit.contain))
                      : Image.asset(logoLocation, fit: BoxFit.contain),
                ),

                // star icon
                product.star! ? const StarIcon() : const SizedBox.shrink(),

                // add to cart icon button
                // Positioned(
                //     bottom: 10.h,
                //     right: 10.w,
                //     child: AddToCartIcon(productID: product.id!))
              ],
            ),
            SizedBox(height: 8.h),

            // product Info
            Expanded(
              child: SizedBox(
                width: double.infinity,
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // product name
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text(product.name!,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: primaryColorShade,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp)),
                    ),
                    SizedBox(height: 8.h),
                    //   product price
                    Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: ProductPriceWidget(price: product.getPrice())),
                    product.discount! <= 0
                        ? Padding(
                            padding: EdgeInsets.only(left: 3.w),
                            child: Text("",
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
                                    fontSize: 12.sp)))
                        : const SizedBox.shrink(),

                    // discount product price
                    product.discount! > 0
                        ? Padding(
                            padding: EdgeInsets.only(left: 3.w),
                            child: Text(
                                product.discount! > 0
                                    ? convertPrice(product.price!)
                                    : "",
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
                                    fontSize: 12.sp)))
                        : const SizedBox.shrink(),

                    SizedBox(height: 8.h),
                    ButtomProduct(product: product)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtomProduct extends GetView<CartController> {
  const ButtomProduct({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (context) {
      int pos = controller.checkProductInCart(product);
      return pos == -1
          ? Padding(
              padding: EdgeInsets.only(left: 16.0.w),
              child: AddToCartButton(productID: product.id!, height: 40))
          : IncDecToCartSmallWidget(
              index: pos, count: controller.allMyItemsCart[pos].count!);
    });
  }
}

class ProductLoaderWidget extends StatelessWidget {
  final bool xlProduct;
  final ProductModel product = ProductModel(
      name: "0000000000000",
      description: "",
      discount: 150,
      price: 5000,
      id: "0");
  ProductLoaderWidget({super.key, this.xlProduct = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            width: xlProduct
                ? MediaQuery.sizeOf(context).width * 0.45
                : MediaQuery.sizeOf(context).width * 0.4,
            margin: EdgeInsets.only(left: xlProduct ? 0 : 8.w),
            // padding: EdgeInsets.all(5),
            child: Column(children: [
              // product image
              Stack(
                children: [
                  // img
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [productShadow]),
                    child: Image.asset(logoLocation, fit: BoxFit.contain),
                  ),
                ],
              ),
              SizedBox(height: 8.h),

              // product Info
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  // color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // product name
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Text(product.name!,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: primaryColorShade,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp)),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}
