import 'package:alrubaie/controller/home_controller.dart';
import 'package:alrubaie/view/widgets/product/product_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utility/constant.dart';
import '../../../utility/widget_loader.dart';

class AllProductesWidget extends GetView<HomeController> {
  const AllProductesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pagePadding),
        child: GetBuilder<HomeController>(builder: (controller) {
          return controller.products.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // عدد الأعمدة
                    crossAxisSpacing: 12.w, // المسافة بين الأعمدة
                    mainAxisSpacing: 0.h, // المسافة بين الصفوف
                    mainAxisExtent: MediaQuery.sizeOf(context).height.h *
                        0.44, // التحكم في ارتفاع العنصر
                  ),
                  itemCount: controller.products.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                      // height: MediaQuery.sizeOf(context).height * 0.37,
                      margin: EdgeInsets.only(bottom: 12.h),
                      child: FadeInUp(
                          child: ProductWidget(
                              xlProduct: true,
                              product: controller.products[index]))),
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
                                widget: ProductLoaderWidget(xlProduct: true));
                          },
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
        }),
      ),
    );
  }
}
