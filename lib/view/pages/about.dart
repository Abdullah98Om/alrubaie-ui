import 'package:alrubaie/utility/app_info.dart';
import 'package:alrubaie/utility/my_dialog.dart';
import 'package:alrubaie/view/widgets/my_button.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utility/constant.dart';
import '../widgets/my_back_icon.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            ListView(
              children: [
                // logo
                SizedBox(height: 40.h),
                FadeInLeft(
                  duration: const Duration(milliseconds: 600),
                  child: Container(
                    width: 200.0.w,
                    height: 200.0.h,
                    padding: EdgeInsets.all(pagePadding),
                    // margin: EdgeInsets.only(top: 24.0.h),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: primaryColorShade,
                      shape: BoxShape.circle,
                    ),
                    child: FadeIn(
                        delay: const Duration(milliseconds: 500),
                        child: Image.asset(logoLocation)),
                  ),
                ),
                SizedBox(height: 48.h),

                // description
                Padding(
                  padding: EdgeInsets.all(pagePadding),
                  child: FadeInRight(
                    delay: const Duration(milliseconds: 300),
                    child: Text(
                      appAbout,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),

                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.2),
                    child: Center(
                        child: FadeInUp(
                      delay: const Duration(milliseconds: 300),
                      child: MyButton(
                          onTap: () {
                            myDilog(
                                confirmf: () async {
                                  Get.back();
                                  await launchUrl(Uri.parse(appLink));
                                },
                                confirmText: "الأنتقال الى واتساب",
                                title: "تواصل معنا",
                                middleText:
                                    "هل تريد الأنتقال الى واتساب للتواصل معنا ؟");
                          },
                          title: "تواصل معنا",
                          height: 60.h),
                    ))),
                SizedBox(height: 40.h),
              ],
            ),

            // back button
            const MyBackIcon()
          ],
        ),
      ),
    );
  }
}
