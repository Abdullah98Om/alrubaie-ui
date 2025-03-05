import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color backgroundColor = Color(0xffEFF8EC);
const Color greyColor = Color(0xffCBD4D4);
const Color primaryColor = Color(0xff71C257);
const Color primaryOpasityColor = Color(0xffCBD4D4);

const Color primaryColorShade = Color(0xff13250E);

const Color secondryColor = Color(0xffF73905);
const Color color1 = Color(0xff448330);
const Color color2 = Color(0xff90CF7C);
const Color color3 = Color(0xffD0EBC7);

/////////////////////////////////////////////////////////////
const LinearGradient linearGradient1 = LinearGradient(
    colors: [primaryColorShade, color1],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter);

BoxShadow productShadow = BoxShadow(
    color: primaryColorShade.withOpacity(0.08),
    blurRadius: 4.sp,
    offset: Offset(0, 4.h));
BoxShadow buttonShadow = BoxShadow(
    color: primaryColorShade.withOpacity(0.2),
    blurRadius: 5.sp,
    offset: Offset(0, 4.h));
//////////////////////////////////////////////////
String imagesLocationAsset = "assets/images";
String iconsLocationAsset = "assets/icons";
String logoLocation = "$iconsLocationAsset/icon.webp"; // app icon logo

String cartIcon = "$iconsLocationAsset/cartIcon.png";
String drawerIcon = "$iconsLocationAsset/drawerIcon.png";

String fontRoboto = "Roboto";
String fontAlmarai = "Almarai";

/////////////////////////////////////////////
///

double pagePadding = 16.w;
