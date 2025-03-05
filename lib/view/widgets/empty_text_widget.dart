import 'package:flutter/material.dart';

import '../../utility/constant.dart';

class EmptyText extends StatelessWidget {
  final String txt;
  const EmptyText({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(txt, style: const TextStyle(color: primaryOpasityColor));
  }
}
