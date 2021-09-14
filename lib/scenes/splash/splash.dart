import 'package:arpi/controllers/splash_controllers.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget{
  SplashController controller = SplashController.to;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Image.asset('assets/FONDO INICIO CARGA.png'),
      ),
    );
  }
}