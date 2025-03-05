import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utility/constant.dart';
import '../my_divider.dart';

class PricePart extends StatelessWidget {
  final String price, deliveryPrice, finalPrice;
  const PricePart({
    super.key,
    required this.price,
    required this.finalPrice,
    required this.deliveryPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyDivider(),
        SizedBox(height: 16.h),
        // price order
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.25,
              child: Text(
                "تكلفة الطلب",
                textAlign: TextAlign.start,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryColorShade,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                price,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryColorShade,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        // delivery price order
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: Text(
                "سعر التوصيل",
                textAlign: TextAlign.start,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryColorShade,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                deliveryPrice,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryColorShade,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        const MyDivider(),
        // final price order
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.25,
              child: Text(
                "التكلفة النهائية",
                textAlign: TextAlign.start,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryColorShade,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                finalPrice,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: secondryColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        const MyDivider(),
      ],
    );
  }
}
