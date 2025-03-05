import 'package:alrubaie/controller/home_controller.dart';
import 'package:alrubaie/utility/router/page_route.dart';
import 'package:alrubaie/utility/widget_loader.dart';
import 'package:alrubaie/view/widgets/home/title_sections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../product/all_products_widget.dart';

class AllProductsPart extends GetView<HomeController> {
  const AllProductsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // All products title
      GetBuilder<HomeController>(builder: (controller) {
        return controller.productsLoader || controller.sectionLoader
            ? WidgetLoader(
                widget: TitleSection(
                mainTitleSection: "جميع المنتجات",
                seconderyTitle: "عرض الكل",
                seconderyOnTap: () {},
              ))
            : TitleSection(
                mainTitleSection: "جميع المنتجات",
                seconderyTitle: "عرض الكل",
                seconderyOnTap: () {
                  Get.toNamed("/${MyPages.products}");
                },
              );
      }),

      const SizedBox(height: 8),

      // All products
      const AllProductesWidget(),
    ]);
  }
}
