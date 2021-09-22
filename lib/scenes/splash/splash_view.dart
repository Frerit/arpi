
import 'dart:async';

import 'package:arpi/scenes/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => {
      Get.offAll(() => HomeView())
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromRGBO(111, 111, 111, 1),
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Image(
              image: AssetImage("assets/splash_animation.gif")
          ),
        )
      ),
    );
  }
}