import 'dart:async';
import 'package:alrubaie/utility/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utility/constant.dart';
import '../../utility/router/page_route.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed("/${MyPages.indexPage}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorShade,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // logo
          Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.6,
                child: Image.asset(logoLocation, fit: BoxFit.contain)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          // loading

          loader(color: Colors.white)
        ],
      ),
    );
  }
}
