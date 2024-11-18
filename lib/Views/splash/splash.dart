import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaylo/animation/dot_view.dart';

import '../../Routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Get.toNamed(RouteNames.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/logo.png',width: 500,)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DotView(Colors.white, Duration(milliseconds: 0)),
              DotView(Colors.white, Duration(milliseconds: 400)),
              DotView(Colors.white, Duration(milliseconds: 800)),
              DotView(Colors.white, Duration(milliseconds: 1200)),
            ],
          ),
        ],
      ),
    );
  }
}
