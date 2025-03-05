import 'package:alrubaie/view/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../utility/constant.dart';
import '../widgets/appbar/my_main_appbar.dart';
import '../widgets/drawer/my_drawer_body.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return AdvancedDrawer(
              backdrop: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    // color: primaryColorShade
                    gradient: linearGradient1),
              ),
              controller: controller.advancedDrawerController,
              animationCurve: Curves.ease,
              animationDuration: const Duration(milliseconds: 300),
              animateChildDecoration: true,
              rtlOpening: true, // true with arabic language
              openScale: 0.85, // حجم الشاشة بعد عرض ال drawer
              disabledGestures: false,
              childDecoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),
              drawer: const MyDrawerBody(),
              child: Scaffold(
                appBar: myMainAppBar(
                    title: "Al-Rubaie",
                    advancedDrawerController:
                        controller.advancedDrawerController),
                body: const HomePage(),
              ));
        });
  }
}
