import 'package:flutter/material.dart';

class SplashView extends StatelessWidget{
  SplashController controller = SplasController.to;
  
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