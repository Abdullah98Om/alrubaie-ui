import 'package:alrubaie/controller/home_controller.dart';
import 'package:alrubaie/utility/constant.dart';
import 'package:alrubaie/utility/widget_loader.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../section/section_widget.dart';

class SectionPart extends StatelessWidget {
  const SectionPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: pagePadding),
      child: SizedBox(
        height: 50.h,
        width: double.infinity,
        child: GetBuilder<HomeController>(builder: (controller) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.sectionLoader || controller.productsLoader
                  ? 5
                  : controller.selectedListSections.length,
              itemBuilder: (context, index) {
                return controller.sectionLoader || controller.productsLoader
                    ? WidgetLoader(
                        widget: SectionWidget(
                            index: index,
                            superSection: false,
                            selected: true,
                            title: "..............."))
                    : controller.selectedSuperSection != null
                        ? FadeInDown(
                            from: index * 30,
                            child: SectionWidget(
                                superSection: false,
                                index: index,
                                selected:
                                    controller.selectedListSections[index].id ==
                                        controller.selectedSection!.id,
                                title: controller
                                    .selectedListSections[index].name!))
                        : const SizedBox.shrink();
              });
        }),
      ),
    );
  }
}
