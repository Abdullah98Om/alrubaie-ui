import 'package:alrubaie/controller/home_controller.dart';
import 'package:alrubaie/utility/widget_loader.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/home/my_carousel_slider_widget.dart';
import '../widgets/home/search_part.dart';
import '../widgets/section/all_sections_xl_part.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 24.h),
        // search
        GetBuilder<HomeController>(builder: (controller) {
          return controller.sectionLoader
              ? const WidgetLoader(widget: SearchPart(searchPage: false))
              : FadeInDown(
                  duration: const Duration(milliseconds: 400),
                  child: const SearchPart(searchPage: false));
        }),

        SizedBox(height: 24.h),

        const MyCarouselSliderWidget(),
        SizedBox(height: 24.h),

        // const SuperSectionPart(),

        // all sections
        const AllSuperSectionXLPart(),
        // All products

        SizedBox(height: 24.h),
        // // BODY
        // Column(
        //   children: [
        //     // Top Products Part
        //     const ProductsPart(),

        //     const AllProductsPart(),

        //     // spacer
        //     SizedBox(height: 16.h)
        //   ],
        // )
      ],
    );
  }
}
