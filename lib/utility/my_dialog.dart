import 'package:alrubaie/utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

myDilog(
    {required VoidCallback confirmf,
    required String confirmText,
    required String title,
    required String middleText}) {
  return Get.defaultDialog(
      backgroundColor: Colors.white,
      title: title,
      middleText: middleText,
      cancel: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text(
              "رجوع",
              style: TextStyle(color: primaryColor),
            ),
          )),
      confirm: InkWell(
        onTap: confirmf,
        child: Container(
            // width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(10)),
            child: Text(
              confirmText,
              style: const TextStyle(color: Colors.white),
            )),
      ));
}
