import 'package:alrubaie/utility/constant.dart';
import 'package:flutter/material.dart';

Widget loader({Color? color}) {
  return Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color ?? primaryColor)));
}
