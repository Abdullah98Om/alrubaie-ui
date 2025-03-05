import 'package:alrubaie/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/appbar/my_main_appbar.dart';
import '../widgets/home/section_part.dart';
import '../widgets/product/products_of_section_part.dart';

class ProductsOfSection extends GetView<HomeController> {
  const ProductsOfSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar1(title: "${controller.selectedSuperSection!.name}"),
      body: ListView(
        children: [
          // spacer
          SizedBox(height: 24.h),

          const SectionPart(),

          SizedBox(height: 24.h),

          // All products for section
          controller.selectedSuperSection != null
              ? const ProductsOfSectionPart()
              : const SizedBox.shrink(),

          // spacer
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
