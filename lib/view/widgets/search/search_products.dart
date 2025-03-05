import 'package:alrubaie/view/widgets/empty_text_widget.dart';
import 'package:alrubaie/view/widgets/product/product_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/searchs_controller.dart';
import '../../../utility/constant.dart';

class SearchProducts extends GetView<SearchsController> {
  const SearchProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pagePadding),
      child: GetBuilder<SearchsController>(builder: (controller) {
        return controller.selectedProducts.isNotEmpty
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // عدد الأعمدة
                  crossAxisSpacing: 8.w, // المسافة بين الأعمدة
                  mainAxisSpacing: 8.h, // المسافة بين الصفوف
                  mainAxisExtent: MediaQuery.sizeOf(context).height.h *
                      0.46, // التحكم في ارتفاع العنصر
                ),
                itemCount: controller.selectedProducts.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                    height: MediaQuery.sizeOf(context).height * 0.32,
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: index.isOdd
                        ? FadeInLeft(
                            from: (index * 25) + 50,
                            child: ProductWidget(
                                xlProduct: true,
                                product: controller.selectedProducts[index]))
                        : FadeInRight(
                            from: (index * 25) + 50,
                            child: ProductWidget(
                                xlProduct: true,
                                product: controller.selectedProducts[index]))),
              )
            : SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: const Center(
                    child: EmptyText(txt: "لا توجد منتجات في البحث")),
              );
      }),
    );
  }
}
