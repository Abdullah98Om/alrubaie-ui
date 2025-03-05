import 'package:alrubaie/utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class WidgetLoader extends StatelessWidget {
  final Widget widget;
  const WidgetLoader({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return widget.redacted(
        context: context,
        redact: true,
        configuration:
            RedactedConfiguration(redactedColor: primaryOpasityColor));
  }
}
