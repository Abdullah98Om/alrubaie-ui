import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../utility/constant.dart';
import '../../../utility/widget_loader.dart';
import '../home/title_sections.dart';
import 'section_xl_widget.dart';

class AllSuperSectionXLPart extends StatelessWidget {
  const AllSuperSectionXLPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // All Sections title
        GetBuilder<HomeController>(builder: (controller) {
          return controller.productsLoader || controller.sectionLoader
              ? WidgetLoader(
                  widget: TitleSection(
                  mainTitleSection: "جميع الأقسام",
                  seconderyOnTap: () {},
                ))
              : TitleSection(
                  mainTitleSection: "الأقسام الرئيسية",
                  seconderyOnTap: () {},
                );
        }),

        const SizedBox(height: 8),
        // all super section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: GetBuilder<HomeController>(builder: (controller) {
            return controller.superSections.isNotEmpty
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // عدد الأعمدة
                      crossAxisSpacing: 12.w, // المسافة بين الأعمدة
                      mainAxisSpacing: 12.w, // المسافة بين الصفوف
                      mainAxisExtent: MediaQuery.sizeOf(context).height.h *
                          0.25, // التحكم في ارتفاع العنصر
                    ),
                    itemCount: controller.superSections.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                        // height: MediaQuery.sizeOf(context).height * 0.37,
                        margin: EdgeInsets.only(bottom: 12.h),
                        child: index.isOdd
                            ? FadeInLeft(
                                from: (index * 25) + 50,
                                child: SectionXLWidget(index: index))
                            : FadeInRight(
                                from: (index * 25) + 50,
                                child: SectionXLWidget(index: index))),
                  )
                : controller.sectionLoader
                    ? const AllSectionsLoader()
                    : const SizedBox.shrink();
          }),
        ),
      ],
    );
  }
}

// sections xl loader
class AllSectionsLoader extends StatelessWidget {
  const AllSectionsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetLoader(
        widget: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        crossAxisSpacing: 12.w, // المسافة بين الأعمدة
        mainAxisSpacing: 8.h, // المسافة بين الصفوف
        mainAxisExtent: MediaQuery.sizeOf(context).height.h *
            0.25, // التحكم في ارتفاع العنصر
      ),
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
          // height: MediaQuery.sizeOf(context).height * 0.37,
          margin: EdgeInsets.only(bottom: 12.h),
          child: Container(
              decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(15.5)))),
    ));
  }
}
