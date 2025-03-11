import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/appbar/my_main_appbar.dart';
import '../widgets/home/search_part.dart';
import '../widgets/search/search_products.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar1(title: "البحث"),
      body: Column(
        children: [
          // spacer
          SizedBox(height: 24.h),

          // search
          const SearchPart(searchPage: true),

          // spacer
          SizedBox(height: 24.h),

          // All search list products
          const SearchProducts(),

          // spacer
          // SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
