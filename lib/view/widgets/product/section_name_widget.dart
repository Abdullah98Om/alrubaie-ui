import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utility/constant.dart';

class SectionNameWidget extends StatelessWidget {
  final int fontSize;
  final String name;
  const SectionNameWidget({super.key, this.fontSize = 14, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(name,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: fontSize.sp));
  }
}
