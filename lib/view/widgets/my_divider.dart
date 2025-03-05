import 'package:flutter/material.dart';

import '../../utility/constant.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: primaryColorShade.withOpacity(0.15),
    );
  }
}
