import 'package:arpi/controllers/splash_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>  with TickerProviderStateMixin {

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 1000),
    );
    animationController.forward();
    animationController.addListener(() {
      setState(() {
        if (animationController.status == AnimationStatus.completed) {
          animationController.forward();
        }
      });
    });
  }

  SplashController controller = SplashController.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey
      ),
      child:  Center(child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return new Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(animationController.value * 10),
              child: child,
              alignment: FractionalOffset.center,
            );
          },
          child: Image.asset('assets/CIRCULO_EDIFICIO.png', width: Get.width / 3
          )))
    );
  }
}