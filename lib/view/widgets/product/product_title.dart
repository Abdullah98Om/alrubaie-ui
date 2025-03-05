import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utility/constant.dart';

class ProductTitle extends StatelessWidget {
  final int maxLines;
  final String title;
  final int fontSize;
  const ProductTitle(
      {super.key, required this.title, this.maxLines = 3, this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.start,
        maxLines: maxLines,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: primaryColorShade,
            fontWeight: FontWeight.bold,
            fontSize: fontSize.sp));
  }
}
