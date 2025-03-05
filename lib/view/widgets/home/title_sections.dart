import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utility/constant.dart';

class TitleSection extends StatelessWidget {
  final String mainTitleSection, seconderyTitle;

  final VoidCallback? seconderyOnTap;

  const TitleSection(
      {super.key,
      required this.mainTitleSection,
      this.seconderyTitle = "",
      this.seconderyOnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pagePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(mainTitleSection,
              style: TextStyle(
                  color: primaryColorShade,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold)),
          if (seconderyTitle != "")
            InkWell(
              onTap: seconderyOnTap,
              child: Text(seconderyTitle,
                  style: TextStyle(
                      color: secondryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }
}
