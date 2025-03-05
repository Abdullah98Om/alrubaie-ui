import 'package:alrubaie/controller/home_controller.dart';
import 'package:alrubaie/utility/constant.dart';
import 'package:alrubaie/utility/loader.dart';
import 'package:alrubaie/view/widgets/my_back_icon.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/my_divider.dart';
import '../widgets/product/buttom_detaile_product_widget.dart';
import '../widgets/product/product_title.dart';
import '../widgets/product/section_name_widget.dart';
import '../widgets/product/star.dart';

class ProductDetaile extends GetView<HomeController> {
  const ProductDetaile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // image product
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            color: primaryColor,
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.white,
              height: MediaQuery.sizeOf(context).height * 0.53,
              width: MediaQuery.sizeOf(context).width,
              child: FadeIn(
                child: CachedNetworkImage(
                    imageUrl: controller.selectedProduct!.img!,
                    placeholder: (context, url) => loader(),
                    fit: BoxFit.cover),
              ),
            ),
          ),

          // product info
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.52,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.34,
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.symmetric(horizontal: pagePadding),
                      child: ListView(
                        children: [
                          // title && star icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: FadeInUp(
                                      child: ProductTitle(
                                          title: controller
                                              .selectedProduct!.name!))),
                              SizedBox(width: 12.w),
                              FadeInUp(
                                  child: controller.selectedProduct!.star!
                                      ? const Star()
                                      : const SizedBox.shrink())
                            ],
                          ),
                          SizedBox(height: 8.w),
                          // section Name
                          FadeInUp(
                              child: SectionNameWidget(
                                  name: controller
                                      .selectedProduct!.section!.name!)),
                          SizedBox(height: 24.w),

                          // description
                          FadeInUp(
                            child: Text(
                                controller.selectedProduct!.description!,
                                textAlign: TextAlign.start,
                                maxLines: 50,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: primaryColorShade,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp)),
                          )
                        ],
                      ),
                    ),
                    const MyDivider(),

                    // buttom cart
                    FadeInUp(child: const ButtomDetaileProductWidget())
                  ],
                ),
              )),

          // back icon
          const MyBackIcon()
        ],
      ),
    );
  }
}
