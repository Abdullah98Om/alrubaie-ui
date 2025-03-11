import 'package:alrubaie/view/widgets/product/product_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../utility/constant.dart';
import '../empty_text_widget.dart';

class ProductsOfSectionPart extends StatelessWidget {
  const ProductsOfSectionPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pagePadding),
            child: controller.selectedProducts.isNotEmpty
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // عدد الأعمدة
                      crossAxisSpacing: 12.w, // المسافة بين الأعمدة
                      mainAxisSpacing: 0.h, // المسافة بين الصفوف
                      mainAxisExtent: MediaQuery.sizeOf(context).height.h *
                          0.44, // التحكم في ارتفاع العنصر
                    ),
                    itemCount: controller.selectedProducts.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                          // height: MediaQuery.sizeOf(context).height * 0.37,
                          margin: EdgeInsets.only(bottom: 12.h),
                          child: FadeInUp(
                              child: ProductWidget(
                                  xlProduct: true,
                                  product:
                                      controller.selectedProducts[index])));
                    })
                : SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    child: const Center(
                        child: EmptyText(txt: "لا توجد منتجات ..")))),
      );
    });
  }
}
