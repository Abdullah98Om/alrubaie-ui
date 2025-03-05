import 'dart:io';

import 'package:flutter/material.dart';

import '../view/widgets/my_snack_bar.dart';

Future<bool> testInternet() async {
  try {
    final List<InternetAddress> result =
        await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      // print('connected');
      return true;
    } else {
      mySnackBar(
          title: "الأنترنت !!",
          body: "تأكد من الاتصال بالأنترنت.",
          icon: Icons.wifi_off_outlined);
      return false;
    }
  } on SocketException catch (_) {
    // print('not connected');

    return false;
  }
}
