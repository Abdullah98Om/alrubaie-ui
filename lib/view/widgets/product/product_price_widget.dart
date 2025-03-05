import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utility/constant.dart';
import '../../../utility/converter.dart';

class ProductPriceWidget extends StatelessWidget {
  final int price;
  const ProductPriceWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(convertPrice(price),
        textAlign: TextAlign.start,
        maxLines: 1,
        textDirection: TextDirection.ltr,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: secondryColor,
            fontWeight: FontWeight.bold,
            fontFamily: fontRoboto,
            fontSize: 18.sp));
  }
}
