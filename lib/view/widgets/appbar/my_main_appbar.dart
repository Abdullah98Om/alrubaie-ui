import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utility/constant.dart';
import '../cart/icon_cart.dart';

AppBar myAppBar1({required String title, bool icon = true, Widget? newIcon}) {
  return AppBar(
    elevation: 0,
    // leading: loadingIcon,
    foregroundColor: Colors.white,
    backgroundColor: primaryColor,
    actions: [
      if (icon)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: const CartIcon(),
        ),
      if (newIcon != null) newIcon
    ],
    title: Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 30.sp, fontWeight: FontWeight.bold, fontFamily: fontRoboto),
    ),
    centerTitle: true,
  );
}

AppBar myMainAppBar(
    {Widget? loadingIcon,
    required String title,
    required AdvancedDrawerController advancedDrawerController}) {
  return AppBar(
    elevation: 0,
    leading: loadingIcon ??
        IconButton(
            onPressed: () {
              // _advancedDrawerController.value = AdvancedDrawerValue.visible();
              advancedDrawerController.showDrawer();
            },
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: value.visible
                      ? Icon(
                          Icons.clear,
                          size: 25.sp,
                          key: ValueKey<bool>(value.visible),
                        )
                      : Image.asset(drawerIcon),
                  // Icon(
                  //   value.visible ? Icons.clear : Icons.menu,
                  //   key: ValueKey<bool>(value.visible),
                  //   size: 25.sp,
                  // ),
                );
              },
            )),
    foregroundColor: Colors.white,
    backgroundColor: primaryColor,
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: const CartIcon(),
      ),
    ],
    title: Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 30.sp, fontWeight: FontWeight.bold, fontFamily: fontRoboto),
    ),
    centerTitle: true,
  );
}
