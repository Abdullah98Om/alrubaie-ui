import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadeScaleTransition extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 0.95, // يبدأ بحجم أقل قليلاً من الحجم الطبيعي
          end: 1.0, // وينتهي بالحجم الطبيعي
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: curve ?? Curves.easeInOut, // منحنى الحركة
          ),
        ),
        child: child,
      ),
    );
  }
}
