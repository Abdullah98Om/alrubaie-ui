import 'package:alrubaie/controller/searchs_controller.dart';
import 'package:alrubaie/utility/router/page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utility/constant.dart';
import '../my_text_field.dart';

class SearchPart extends GetView<SearchsController> {
  final bool searchPage;
  const SearchPart({super.key, required this.searchPage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: MyTextField(
            hintText: "البحث عن منتج",
            textEditingController: TextEditingController(),
            icon: Icons.search,
            // textEditingController: textEditingController,
            onChanged: (v) {
              controller.search(v);
            },
            validator: (p0) {},
          ),
        ),
        if (!searchPage)
          InkWell(
            onTap: () {
              Get.toNamed("/${MyPages.search}");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: pagePadding),
              child: Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
              ),
            ),
          ),
      ],
    );
  }
}
