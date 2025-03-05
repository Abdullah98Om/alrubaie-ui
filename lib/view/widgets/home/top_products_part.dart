import 'package:alrubaie/controller/home_controller.dart';

import 'package:alrubaie/utility/widget_loader.dart';
import 'package:alrubaie/view/widgets/home/title_sections.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utility/constant.dart';
import '../my_divider.dart';
import '../product/product_widget.dart';

class ProductsPart extends GetView<HomeController> {
  const ProductsPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(children: [
        // star products title
        controller.starProducts.isNotEmpty
            ? const TitleSection(
                mainTitleSection: "المنتجات المميزة", seconderyTitle: "")
            : controller.productsLoader || controller.sectionLoader
                ? const WidgetLoader(
                    widget: TitleSection(
                        mainTitleSection: "المنتجات المميزة",
                        seconderyTitle: ""))
                : const SizedBox.shrink(),
        const SizedBox(height: 8),

        // products star
        controller.starProducts.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(right: pagePadding),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.42,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.starProducts.length,
                    itemBuilder: (context, index) {
                      return FadeInDown(
                          from: (index * 50) + 50,
                          child: ProductWidget(
                              product: controller.starProducts[index]));
                    },
                  ),
                ),
              )
            : controller.productsLoader || controller.sectionLoader
                ? Padding(
                    padding: EdgeInsets.only(right: pagePadding),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.36,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return WidgetLoader(
                              widget: ProductLoaderWidget(xlProduct: false));
                        },
                      ),
                    ),
                  )
                : const SizedBox.shrink(),

        // spacer
        if (controller.starProducts.isNotEmpty) SizedBox(height: 12.h),
        // divider
        if (controller.starProducts.isNotEmpty)
          Padding(
              padding: EdgeInsets.symmetric(horizontal: pagePadding),
              child: const MyDivider()),

        // spacer
        SizedBox(height: 12.h),
      ]);
    });
  }
}
