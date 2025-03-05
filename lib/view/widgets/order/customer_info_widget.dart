import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utility/constant.dart';
import '../my_divider.dart';

class CusomerInfoWidget extends StatelessWidget {
  final String name, location, phone;
  const CusomerInfoWidget(
      {super.key,
      required this.name,
      required this.location,
      required this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyDivider(),
        SizedBox(height: 12.h),
        // name
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: Text(
                "الأسم",
                textAlign: TextAlign.start,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryColorShade,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: Text(
                name,
                textAlign: TextAlign.end,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryColorShade,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // location
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: Text(
                "العنوان",
                textAlign: TextAlign.start,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryColorShade,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: Text(
                location,
                textAlign: TextAlign.end,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryColorShade,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // phone
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: Text(
                "الهاتف",
                textAlign: TextAlign.start,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryColorShade,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: Text(
                phone,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryColorShade,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
