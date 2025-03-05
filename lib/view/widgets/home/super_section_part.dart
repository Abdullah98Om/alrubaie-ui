import 'package:alrubaie/controller/home_controller.dart';
import 'package:alrubaie/utility/constant.dart';
import 'package:alrubaie/utility/widget_loader.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../section/section_widget.dart';

class SuperSectionPart extends StatelessWidget {
  const SuperSectionPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: pagePadding),
      child: SizedBox(
        height: 40.h,
        width: double.infinity,
        child: GetBuilder<HomeController>(builder: (controller) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.sectionLoader || controller.productsLoader
                  ? 5
                  : controller.superSections.length,
              itemBuilder: (context, index) {
                return controller.sectionLoader || controller.productsLoader
                    ? WidgetLoader(
                        widget: SectionWidget(
                            index: index,
                            superSection: true,
                            selected: true,
                            title: "..............."))
                    : controller.selectedSuperSection != null
                        ? FadeInDown(
                            from: index * 30,
                            child: SectionWidget(
                                superSection: true,
                                index: index,
                                selected: controller.superSections[index].id ==
                                    controller.selectedSuperSection!.id,
                                title: controller.superSections[index].name!))
                        : const SizedBox.shrink();
              });
        }),
      ),
    );
  }
}
