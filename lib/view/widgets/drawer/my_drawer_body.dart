import 'package:alrubaie/view/widgets/logo_circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utility/app_info.dart';
import '../../../utility/my_dialog.dart';
import '../../../utility/router/page_route.dart';

class MyDrawerBody extends StatelessWidget {
  const MyDrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 12.h),
            // user image or App icon (when no login)
            LogoCircleWidget(width: 90.w), SizedBox(height: 16.h),

            // list

            // home page button
            // ListTile(
            //   onTap: () {
            //     Get.offAllNamed("/${MyPages.indexPage}");
            //   },
            //   leading: Icon(Icons.home, size: 24.sp),
            //   title: const Text('الصفحة الرئيسية'),
            // ),

            // cart button
            ListTile(
              onTap: () {
                Get.toNamed("/${MyPages.cart}");
              },
              leading: Icon(Icons.shopping_cart, size: 24.sp),
              title: const Text('السلة'),
            ),
            // search button
            ListTile(
              onTap: () {
                Get.toNamed("/${MyPages.myOrders}");
              },
              leading: Icon(Icons.view_list, size: 24.sp),
              title: const Text('طلباتي'),
            ),
            // search button
            ListTile(
              onTap: () {
                Get.toNamed("/${MyPages.search}");
              },
              leading: Icon(Icons.search, size: 24.sp),
              title: const Text('البحث'),
            ),

            // Products button
            ListTile(
              onTap: () {
                Get.toNamed("/${MyPages.products}");
              },
              leading: Icon(Icons.list, size: 24.sp),
              title: const Text('المنتجات'),
            ),

            // About APP button
            ListTile(
              onTap: () {
                Get.toNamed("/${MyPages.about}");
              },
              leading: Icon(Icons.info, size: 24.sp),
              title: const Text('حول التطبيق'),
            ),

            // visit link button
            ListTile(
              onTap: () {
                myDilog(
                    confirmf: () async {
                      Get.back();
                      await launchUrl(Uri.parse(appLink));
                    },
                    confirmText: "الأنتقال الى واتساب",
                    title: "تواصل معنا",
                    middleText: "هل تريد الأنتقال الى واتساب للتواصل معنا ؟");
              },
              leading: Icon(Icons.link, size: 24.sp),
              title: const Text('تواصل معنا'),
            ),

            // exit button
            ListTile(
              onTap: () {
                SystemNavigator.pop(); // إغلاق التطبيق بالطريقة الموصى بها
              },
              leading: Icon(
                Icons.exit_to_app,
                size: 24.sp,
              ),
              title: const Text('خروج'),
            ),

            // about me (Developer)
            const Spacer(),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white54,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.h),
                // child: const Text('Terms of Service | Privacy Policy'),
                child: const Text(
                  'App developed by Abdullah.\nMy profile: [Instagram @yalla.dev]\n© 2025 All rights reserved.',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
