import 'package:alrubaie/controller/order_controller.dart';
import 'package:alrubaie/utility/constant.dart';
import 'package:alrubaie/utility/converter.dart';
import 'package:alrubaie/view/widgets/appbar/my_main_appbar.dart';
import 'package:alrubaie/view/widgets/my_button.dart';
import 'package:alrubaie/view/widgets/my_snack_bar.dart';
import 'package:alrubaie/view/widgets/my_text_field.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/logo_circle_widget.dart';
import '../widgets/order/price_part_widget.dart';

class ShaippingOrder extends GetView<OrderController> {
  const ShaippingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: myAppBar1(title: "أكمال الطلب", icon: false),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: controller.formkey,
          child: ListView(
            children: [
              SizedBox(height: 16.h),
              // Logo Circle
              FadeInDown(
                  child: LogoCircleWidget(
                      width: MediaQuery.sizeOf(context).width * 0.25)),
              SizedBox(height: 16.h),
              // name
              FadeInRight(
                from: 100,
                child: MyTextFieldWithTitle(
                    textEditingController: controller.nameTextEditingController,
                    title: "الأسم",
                    validator: (v) {
                      if (v.isNotEmpty) {
                        return null;
                      } else {
                        mySnackBar(
                            title: "الأسم",
                            body: "أدخل الأسم بشكل صحيح",
                            icon: Icons.person);
                        return null;
                      }
                    },
                    hintText: "أدخل أسمك الثلاثي بشكل صحيح ..",
                    onChanged: (v) {},
                    icon: Icons.person),
              ),
              SizedBox(height: 24.h),
              // location
              FadeInRight(
                from: 150,
                child: MyTextFieldWithTitle(
                    textEditingController:
                        controller.locationTextEditingController,
                    title: "العنوان",
                    validator: (v) {
                      if (v.isNotEmpty) {
                        return null;
                      } else {
                        mySnackBar(
                            title: "العنوان",
                            body: "أدخل عنوانك بشكل صحيح",
                            icon: Icons.location_on);
                        return null;
                      }
                    },
                    hintText: "أدخل عنوانك الكامل ..",
                    onChanged: (v) {},
                    icon: Icons.location_on),
              ),
              SizedBox(height: 24.h),

              // phone
              FadeInRight(
                from: 200,
                child: MyTextFieldWithTitle(
                    textEditingController:
                        controller.phoneTextEditingController,
                    title: "رقم الموبايل",
                    validator: (v) {
                      try {
                        final isNum = int.tryParse(v);
                        if (isNum != null && v.length > 9 && v.length < 12) {
                          return null;
                        } else {
                          if (isNum == null) {
                            mySnackBar(
                                title: "رقم الموبايل",
                                body: "أدخل رقم موبايل صحيح",
                                icon: Icons.phone_iphone);
                            return null;
                          } else {
                            // print("رقم الموبايل يتكون من 11 رقم كحد أقصى");
                            mySnackBar(
                                title: "رقم الموبايل",
                                body: "رقم الموبايل يتكون من 11 رقم كحد أقصى",
                                icon: Icons.phone_iphone);
                            return null;
                          }
                        }
                      } catch (ex) {
                        // print(ex);
                        mySnackBar(
                            title: "رقم الموبايل",
                            body: "أدخل رقم موبايل صحيح",
                            icon: Icons.phone_iphone);
                        return null;
                      }
                    },
                    hintText: "أدخل رقم موبايلك بشكل صحيح ..",
                    keyboardType: TextInputType.phone,
                    onChanged: (v) {},
                    icon: Icons.phone_iphone),
              ),
              SizedBox(height: 24.h),
              // note
              FadeInRight(
                from: 250,
                child: MyTextFieldWithTitle(
                    textEditingController: controller.noteTextEditingController,
                    title: "ملاحظة",
                    validator: (v) {},
                    hintText: "أكتب ملاحظة ..",
                    keyboardType: TextInputType.text,
                    onChanged: (v) {},
                    icon: Icons.note_add),
              ),
              SizedBox(height: 24.h),
              // price order , price delivery
              FadeInUp(
                child: PricePart(
                    finalPrice: "لم يحدد بعد",
                    price:
                        convertPrice(controller.cartController.getPriceCart()),
                    deliveryPrice: "لم يحدد بعد"),
              ),
              SizedBox(height: 24.h),
              FadeInUp(
                child: MyButton(
                    onTap: () {
                      controller.doneInformationOrder();
                    },
                    title: "حفظ ومتابعة",
                    height: 60.h,
                    color: secondryColor),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
