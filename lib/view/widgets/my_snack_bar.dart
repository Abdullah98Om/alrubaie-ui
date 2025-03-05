import 'package:alrubaie/utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mySnackBar(
    {required String title,
    required String body,
    IconData icon = Icons.notifications_active_outlined,
    Color colorText = primaryColorShade}) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar(title, body,
        icon: Icon(
          icon,
          color: colorText,
          size: 30,
        ),
        colorText: colorText);
  }
}
