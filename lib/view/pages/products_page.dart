import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/appbar/my_main_appbar.dart';
import '../widgets/home/search_part.dart';
import '../widgets/product/all_products_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar1(title: "المنتجات"),
      body: ListView(
        children: [
          // spacer
          SizedBox(height: 24.h),

          // search
          const SearchPart(searchPage: false),

          // spacer
          SizedBox(height: 24.h),

          // All products
          const AllProductesWidget(),

          // spacer
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
