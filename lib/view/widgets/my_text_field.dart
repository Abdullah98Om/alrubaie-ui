import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/constant.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;

  // TextEditingController textEditingController;
  final Function(String) validator;
  final Function(String) onChanged;
  final TextEditingController textEditingController;

  const MyTextField({
    super.key,
    required this.textEditingController,
    required this.validator,
    required this.hintText,
    required this.onChanged,
    required this.icon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFeildWidget(
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      hintText: hintText,
      icon: icon,
      textEditingController: textEditingController,
    );
  }
}

class MyTextFieldWithTitle extends StatelessWidget {
  final String hintText, title;
  final IconData icon;
  final TextInputType keyboardType;

  final TextEditingController? textEditingController;
  final Function(String) validator;
  final Function(String) onChanged;

  const MyTextFieldWithTitle(
      {super.key,
      required this.title,
      required this.validator,
      required this.hintText,
      required this.onChanged,
      required this.icon,
      this.keyboardType = TextInputType.text,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title :",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
        SizedBox(height: 8.h),
        TextFeildWidget(
            textEditingController: textEditingController!,
            keyboardType: keyboardType,
            validator: validator,
            onChanged: onChanged,
            hintText: hintText,
            icon: icon),
      ],
    );
  }
}

class TextFeildWidget extends StatelessWidget {
  const TextFeildWidget({
    super.key,
    required this.textEditingController,
    required this.keyboardType,
    required this.validator,
    required this.onChanged,
    required this.hintText,
    required this.icon,
  });

  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final Function(String p1) validator;
  final Function(String p1) onChanged;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [productShadow]),
      child: TextFormField(
        controller: textEditingController,
        maxLines: 1,
        keyboardType: keyboardType,
        style:
            const TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        cursorColor: primaryColorShade,
        validator: (val) => validator(val!),
        onChanged: (value) {
          onChanged(value);
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: Icon(
              icon,
              color: primaryColor.withOpacity(0.3),
            ),
            hintStyle: TextStyle(
                color: primaryColor.withOpacity(0.3), fontSize: 14.sp)),
      ),
    );
  }
}
